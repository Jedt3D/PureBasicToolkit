#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Shared compiler detection and mode helpers for this repo.
source "${SCRIPT_DIR}/purebasic-common.sh"

usage() {
  cat <<'EOF'
Usage: scripts/pbc.sh [options] [source.pb]

Compile or syntax-check a PureBasic source file using repo defaults.
EOF
  pb_help_common
}

check_only=0
debug_build=0
mode_override=""
output_override=""
source_file=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)
      check_only=1
      shift
      ;;
    --debug)
      debug_build=1
      shift
      ;;
    --console)
      mode_override="console"
      shift
      ;;
    --gui)
      mode_override="gui"
      shift
      ;;
    --library)
      mode_override="library"
      shift
      ;;
    -o|--output)
      output_override="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      if [[ -n "${source_file}" ]]; then
        echo "Only one source file can be provided." >&2
        exit 1
      fi
      source_file="$1"
      shift
      ;;
  esac
done

if [[ -z "${source_file}" ]]; then
  source_file="$(pb_find_source)"
fi

if [[ ! -f "${source_file}" ]]; then
  echo "Source file not found: ${source_file}" >&2
  exit 1
fi

compiler="$(pb_resolve_compiler)"
mode="${mode_override:-$(pb_detect_mode "${source_file}")}"

cmd=("${compiler}" "-z" "-l" "-q")

if [[ "${debug_build}" -eq 1 ]]; then
  cmd+=("-d")
fi

case "${mode}" in
  console)
    cmd+=("-cl")
    ;;
  gui)
    ;;
  library)
    ;;
  *)
    echo "Unsupported mode: ${mode}" >&2
    exit 1
    ;;
esac

if [[ "${check_only}" -eq 1 ]]; then
  cmd+=("${source_file}" "-k")
  echo "Syntax checking ${source_file} (mode: ${mode})"
else
  output_path="${output_override:-$(pb_default_output "${source_file}" "${mode}")}"
  if [[ "${mode}" == "library" ]]; then
    cmd+=("${source_file}" "-dl" "${output_path}")
  else
    cmd+=("${source_file}" "-o" "${output_path}")
  fi
  echo "Compiling ${source_file} -> ${output_path} (mode: ${mode})"
fi

"${cmd[@]}"
