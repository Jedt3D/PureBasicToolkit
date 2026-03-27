#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Shared compiler detection and mode helpers for this repo.
source "${SCRIPT_DIR}/purebasic-common.sh"

usage() {
  cat <<'EOF'
Usage: scripts/run.sh [options] [source.pb]

Compile and run a PureBasic source file using repo defaults.
EOF
  pb_help_common
}

debug_build=0
mode_override=""
source_file=""

while [[ $# -gt 0 ]]; do
  case "$1" in
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
base_name="$(basename "${source_file}" .pb)"
os_name="$(pb_detect_os)"

case "${mode}" in
  console)
    output_path="/tmp/${base_name}_run"
    ;;
  gui)
    case "${os_name}" in
      macos) output_path="/tmp/${base_name}_run.app" ;;
      windows) output_path="/tmp/${base_name}_run.exe" ;;
      *) output_path="/tmp/${base_name}_run" ;;
    esac
    ;;
  library)
    output_path="/tmp/$(pb_default_output "${source_file}" "${mode}")"
    ;;
  *)
    echo "Unsupported mode: ${mode}" >&2
    exit 1
    ;;
esac

cmd=("${compiler}" "-z" "-l" "-q")

if [[ "${debug_build}" -eq 1 ]]; then
  cmd+=("-d")
fi

if [[ "${mode}" == "console" ]]; then
  cmd+=("-cl")
elif [[ "${mode}" == "gui" && "${os_name}" == "macos" ]]; then
  cmd+=("-f")
fi

if [[ "${mode}" == "library" ]]; then
  cmd+=("${source_file}" "-dl" "${output_path}")
  echo "Compiled library ${source_file} -> ${output_path}"
  "${cmd[@]}"
  echo "Shared libraries are not launched automatically."
  exit 0
fi

cmd+=("${source_file}" "-o" "${output_path}")
echo "Compiling ${source_file} -> ${output_path} (mode: ${mode})"
"${cmd[@]}"

if [[ "${mode}" == "console" ]]; then
  echo "Running ${output_path}"
  "${output_path}"
else
  echo "Launching ${output_path}"
  if [[ "${os_name}" == "macos" ]]; then
    open "${output_path}"
  else
    "${output_path}"
  fi
fi
