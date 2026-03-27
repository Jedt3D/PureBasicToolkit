#!/usr/bin/env bash

set -euo pipefail

pb_detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux) echo "linux" ;;
    MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
    *) echo "unknown" ;;
  esac
}

pb_resolve_compiler() {
  local candidates=(
    "/Applications/PureBasic.app/Contents/Resources/compilers/pbcompiler"
    "/usr/local/purebasic/compilers/pbcompiler"
    "C:/Program Files/PureBasic/Compilers/pbcompiler.exe"
  )
  local candidate

  if [[ -n "${PUREBASIC_COMPILER:-}" && -x "${PUREBASIC_COMPILER}" ]]; then
    echo "${PUREBASIC_COMPILER}"
    return 0
  fi

  for candidate in "${candidates[@]}"; do
    if [[ -x "${candidate}" ]]; then
      echo "${candidate}"
      return 0
    fi
  done

  if command -v pbcompiler >/dev/null 2>&1; then
    command -v pbcompiler
    return 0
  fi

  echo "PureBasic compiler not found. Set PUREBASIC_COMPILER or install pbcompiler." >&2
  return 1
}

pb_find_source() {
  local -a preferred=("main.pb" "Source.pb")
  local candidate
  local -a files=()

  for candidate in "${preferred[@]}"; do
    if [[ -f "${candidate}" ]]; then
      echo "${candidate}"
      return 0
    fi
  done

  while IFS= read -r candidate; do
    files+=("${candidate}")
  done < <(find . -maxdepth 1 -type f -name '*.pb' -print | sed 's#^\./##' | sort)

  if [[ "${#files[@]}" -eq 1 ]]; then
    echo "${files[0]}"
    return 0
  fi

  if [[ "${#files[@]}" -eq 0 ]]; then
    echo "No .pb source file found in the current directory." >&2
  else
    echo "Multiple .pb files found. Pass the source file explicitly:" >&2
    printf '  %s\n' "${files[@]}" >&2
  fi
  return 1
}

pb_detect_mode() {
  local source_file="$1"

  if grep -Eq 'Procedure(C)?DLL[[:space:]]' "${source_file}"; then
    echo "library"
  elif grep -Eq 'OpenConsole[[:space:]]*\(|PrintN?[[:space:]]*\(|Input[[:space:]]*\(' "${source_file}"; then
    echo "console"
  elif grep -Eq 'OpenWindow[[:space:]]*\(|WaitWindowEvent[[:space:]]*\(|[A-Za-z]+Gadget[[:space:]]*\(' "${source_file}"; then
    echo "gui"
  else
    echo "console"
  fi
}

pb_default_output() {
  local source_file="$1"
  local mode="$2"
  local os_name
  local file_name
  local base_name

  os_name="$(pb_detect_os)"
  file_name="$(basename "${source_file}")"
  base_name="${file_name%.pb}"

  case "${mode}" in
    console)
      echo "${base_name}"
      ;;
    gui)
      case "${os_name}" in
        macos) echo "${base_name}.app" ;;
        windows) echo "${base_name}.exe" ;;
        *) echo "${base_name}" ;;
      esac
      ;;
    library)
      case "${os_name}" in
        macos) echo "${base_name}.dylib" ;;
        windows) echo "${base_name}.dll" ;;
        *) echo "${base_name}.so" ;;
      esac
      ;;
    *)
      echo "${base_name}"
      ;;
  esac
}

pb_help_common() {
  cat <<'EOF'
Options:
  --check            Syntax check only (-k)
  --debug            Enable debugger (-d)
  --console          Force console mode (-cl)
  --gui              Force GUI mode
  --library          Force shared library mode
  -o, --output PATH  Override output path
  -h, --help         Show help
EOF
}
