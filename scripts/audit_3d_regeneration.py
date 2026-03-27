#!/usr/bin/env python3

from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
REFERENCE_DIR = ROOT / "reference_3d_game_engine"
INTERMEDIATE_DIR = ROOT / "intermediate_3d_game_engine_sources"
GENERATED_DIR = ROOT / "generated_3d_game_engine_sources"


def collect_reference() -> set[str]:
    return {
        str(path.relative_to(REFERENCE_DIR))
        for path in REFERENCE_DIR.rglob("*.pb")
    }


def collect_intermediate() -> set[str]:
    items: set[str] = set()
    for path in INTERMEDIATE_DIR.rglob("*.md"):
        relative = path.relative_to(INTERMEDIATE_DIR)
        items.add(str(relative.with_suffix(".pb")))
    return items


def collect_generated() -> set[str]:
    return {
        str(path.relative_to(GENERATED_DIR))
        for path in GENERATED_DIR.rglob("*.pb")
    }


def print_group(title: str, values: list[str]) -> None:
    print(title)
    if not values:
        print("  (none)")
        return
    for value in values:
        print(f"  - {value}")


def main() -> None:
    reference = collect_reference()
    intermediate = collect_intermediate()
    generated = collect_generated()

    missing_intermediate = sorted(reference - intermediate)
    missing_generated = sorted(reference - generated)
    orphan_intermediate = sorted(intermediate - reference)
    orphan_generated = sorted(generated - reference)

    print("3D regeneration pipeline audit")
    print(f"  reference files:    {len(reference)}")
    print(f"  intermediate files: {len(intermediate)}")
    print(f"  generated files:    {len(generated)}")
    print("")

    print_group("Missing intermediate descriptions:", missing_intermediate)
    print("")
    print_group("Missing generated sources:", missing_generated)
    print("")
    print_group("Intermediate files without a matching reference:", orphan_intermediate)
    print("")
    print_group("Generated files without a matching reference:", orphan_generated)


if __name__ == "__main__":
    main()
