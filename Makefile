SHELL := /bin/bash

PBC := scripts/pbc.sh
RUN := scripts/run.sh
PYTHON := python3

TOP_SOURCES := helloworld.pb console.pb fileio.pb
REFERENCE_EXPECTED_FAILS := reference_sources/AudioCD.pb reference_sources/MDI_ImageViewer.pb reference_sources/SystemFolders.pb

.PHONY: help check-top check-generated check-generated-3d check-reference check-reference-3d check-all audit-3d audit-generation run-console run-fileio run-hello

help:
	@echo "Available targets:"
	@echo "  make check-top           Syntax-check the three hand-written sample programs"
	@echo "  make check-generated     Syntax-check generated_sources/"
	@echo "  make check-generated-3d  Syntax-check generated_3d_game_engine_sources/"
	@echo "  make check-reference     Syntax-check reference_sources/ (allows expected macOS failures)"
	@echo "  make check-reference-3d  Syntax-check reference_3d_game_engine/"
	@echo "  make check-all           Run every syntax-check target plus the 3D audit"
	@echo "  make audit-3d            Compare reference/intermediate/generated 3D coverage"
	@echo "  make audit-generation    Audit coverage and common quality signals for both generated trees"
	@echo "  make run-console         Compile and run console.pb"
	@echo "  make run-fileio          Compile and run fileio.pb"
	@echo "  make run-hello           Compile and launch helloworld.pb"

check-top:
	@for f in $(TOP_SOURCES); do \
		$(PBC) --check "$$f"; \
	done

check-generated:
	@find generated_sources -type f -name '*.pb' | sort | while IFS= read -r f; do \
		$(PBC) --check "$$f"; \
	done

check-generated-3d:
	@find generated_3d_game_engine_sources -type f -name '*.pb' | sort | while IFS= read -r f; do \
		$(PBC) --check "$$f"; \
	done

check-reference:
	@find reference_sources -type f -name '*.pb' | sort | while IFS= read -r f; do \
		if $(PBC) --check "$$f" >/dev/null 2>&1; then \
			echo "OK $$f"; \
		elif [[ " $(REFERENCE_EXPECTED_FAILS) " == *" $$f "* ]]; then \
			echo "EXPECTED FAIL $$f"; \
		else \
			echo "UNEXPECTED FAIL $$f" >&2; \
			$(PBC) --check "$$f"; \
			exit 1; \
		fi; \
	done

check-reference-3d:
	@find reference_3d_game_engine -type f -name '*.pb' | sort | while IFS= read -r f; do \
		$(PBC) --check "$$f"; \
	done

check-all: check-top check-generated check-generated-3d check-reference check-reference-3d audit-3d

audit-3d:
	@$(PYTHON) scripts/audit_3d_regeneration.py

audit-generation:
	@$(PYTHON) scripts/audit_generation_quality.py

run-console:
	@$(RUN) console.pb

run-fileio:
	@$(RUN) fileio.pb

run-hello:
	@$(RUN) helloworld.pb
