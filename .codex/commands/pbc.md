---
description: Compile PureBasic source files with the repo's Codex-first workflow
---
Use `scripts/pbc.sh` to compile or syntax-check PureBasic source files.

Examples:

```bash
scripts/pbc.sh console.pb
scripts/pbc.sh --check generated_sources/Json.pb
scripts/pbc.sh --gui helloworld.pb
scripts/pbc.sh --library mylib.pb
```

The script auto-detects:
- compiler path
- target mode (console, GUI, or shared library)
- default output name

Prefer this over ad hoc `pbcompiler` calls so mode detection and output naming stay consistent across Codex sessions.
