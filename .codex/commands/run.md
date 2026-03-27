---
description: Compile and run PureBasic source files with the repo's Codex-first workflow
---
Use `scripts/run.sh` to build and launch a PureBasic target.

Examples:

```bash
scripts/run.sh console.pb
scripts/run.sh fileio.pb
scripts/run.sh --gui helloworld.pb
```

Behavior:
- console targets are compiled with `-cl` and executed directly
- GUI targets are compiled as app bundles on macOS and launched with `open`
- shared libraries are compiled but not launched

Prefer this script over legacy command wrappers so Codex can use the same source-of-truth workflow as humans.
