#!/usr/bin/env python3

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent


@dataclass(frozen=True)
class Corpus:
    name: str
    reference_dir: Path
    generated_dir: Path
    expected_missing: frozenset[str] = frozenset()


CORPORA = [
    Corpus(
        "general",
        ROOT / "reference_sources",
        ROOT / "generated_sources",
        frozenset(
            {
                "AudioCD.pb",
                "DLLSample.pb",
                "MDI_ImageViewer.pb",
                "SystemFolders.pb",
            }
        ),
    ),
    Corpus("3d", ROOT / "reference_3d_game_engine", ROOT / "generated_3d_game_engine_sources"),
]

PITFALL_PATTERNS = {
    "mixed_string_suffix": re.compile(r"\b(?:Define|Protected|Global)\s+[^\n;]*\$\.s\b"),
    "pointer_native_suffix": re.compile(r"\*[A-Za-z_][A-Za-z0-9_]*\.[ilqfdbswac]\b"),
    "invented_fileexists": re.compile(r"\bFileExists\s*\("),
    "invented_randomize": re.compile(r"\bRandomize\s*\("),
    "invented_os_constants": re.compile(r"#PB_(?:OSX_10_0|Linux_2_2|Windows_XP)\b"),
    "reserved_integer_structure": re.compile(r"\bStructure\s+INTEGER\b"),
}


def strip_strings(line: str) -> str:
    result: list[str] = []
    in_string = False
    escaped = False
    for char in line:
        if in_string:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = False
            continue
        if char == '"':
            in_string = True
            continue
        result.append(char)
    return "".join(result)


def list_pb_files(base: Path) -> dict[str, Path]:
    return {
        str(path.relative_to(base)): path
        for path in sorted(base.rglob("*.pb"))
    }


def enableexplicit_stats(paths: dict[str, Path]) -> tuple[int, int, list[str]]:
    any_count = 0
    first_count = 0
    missing: list[str] = []

    for rel, path in paths.items():
        text = path.read_text(errors="ignore")
        if "EnableExplicit" in text:
            any_count += 1
        else:
            missing.append(rel)

        first_non = ""
        for line in text.splitlines():
            if line.strip():
                first_non = line.strip()
                break
        if first_non == "EnableExplicit":
            first_count += 1

    return any_count, first_count, missing


def pitfall_hits(paths: dict[str, Path]) -> dict[str, list[str]]:
    hits: dict[str, list[str]] = {name: [] for name in PITFALL_PATTERNS}
    for rel, path in paths.items():
        for line_number, raw_line in enumerate(path.read_text(errors="ignore").splitlines(), 1):
            candidate = strip_strings(raw_line)
            for name, pattern in PITFALL_PATTERNS.items():
                if pattern.search(candidate):
                    hits[name].append(f"{rel}:{line_number}")
    return hits


def print_group(title: str, values: list[str]) -> None:
    print(title)
    if not values:
        print("  (none)")
        return
    for value in values:
        print(f"  - {value}")


def audit_corpus(corpus: Corpus) -> None:
    reference = list_pb_files(corpus.reference_dir)
    generated = list_pb_files(corpus.generated_dir)

    missing_generated = sorted(set(reference) - set(generated))
    expected_missing = sorted(set(missing_generated) & corpus.expected_missing)
    unexpected_missing = sorted(set(missing_generated) - corpus.expected_missing)
    orphan_generated = sorted(set(generated) - set(reference))
    any_count, first_count, missing_enable = enableexplicit_stats(generated)
    hits = pitfall_hits(generated)

    print(f"=== {corpus.name} corpus ===")
    print(f"reference files: {len(reference)}")
    print(f"generated files: {len(generated)}")
    print(f"enableexplicit anywhere: {any_count}/{len(generated)}")
    print(f"enableexplicit first line: {first_count}/{len(generated)}")
    print("")
    print_group("Expected missing generated files:", expected_missing)
    print("")
    print_group("Unexpected missing generated files:", unexpected_missing)
    print("")
    print_group("Generated files without reference match:", orphan_generated)
    print("")
    print_group("Generated files missing EnableExplicit:", missing_enable)
    print("")
    for name, locations in hits.items():
        print_group(f"Pitfall scan: {name}", locations[:20])
        if len(locations) > 20:
            print(f"  ... and {len(locations) - 20} more")
        print("")


def main() -> None:
    print("PureBasic generation quality audit")
    print(f"repo: {ROOT}")
    print("")
    for corpus in CORPORA:
        audit_corpus(corpus)


if __name__ == "__main__":
    main()
