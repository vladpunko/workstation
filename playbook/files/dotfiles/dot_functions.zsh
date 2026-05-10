ff() {
  # Show the contents of the current working directory matching a given string pattern.
  # `${=PAGER}` expands the pager command into words so values like `less -R`
  # still work as expected.
  command find "${PWD}" -name "*$1*" -print | command sort --reverse --ignore-case | ${=PAGER}
}

g() {
  if [[ -z "$1" ]]; then
    # Show the current user's name and email address in the main working tree.
    printf "%s <%s>\\n" "$(command git config user.name)" "$(command git config user.email)"

    # Show the working tree status.
    command git status --branch --short
  else
    command git "$@"
  fi
}
compdef g=git

gotoday() {
  local today
  today="$(command date '+%Y-%m-%d')"

  # Create a new directory if it does not exist.
  command mkdir -p -- "${today}"

  # Navigate into the date-stamped directory just created.
  if ! builtin cd -P -- "${today}"; then
    return 1
  fi
}

o() {
  if [[ -z "$1" ]]; then
    # Open the current working directory in a new detached program session.
    command detach open -- "${PWD}"
  else
    command detach open -- "$@"
  fi
}

pdfsanitize() {
  local source_path output_path

  if [[ -z "$1" ]]; then
    echo 'Pass a PDF file path as the first argument.' >&2
    return 1
  fi

  source_path="${1:A}"

  if [[ ! -f "${source_path}" || "${source_path:e:l}" != "pdf" ]]; then
    echo 'This command requires an existing PDF file.' >&2
    return 1
  fi

  if ! command -v exiftool > /dev/null 2>&1; then
    echo 'This command requires exiftool.' >&2
    return 1
  fi

  if [[ -n "$2" ]]; then
    output_path="${2:A}"
  else
    # Reuse the existing `zetid` helper to create a timestamped output name.
    zetid
    output_path="${PWD}/$(command pbpaste).pdf"
  fi

  if [[ "${output_path:A}" == "${source_path}" ]]; then
    echo 'Choose a different output path.' >&2
    return 1
  fi

  if ! command mkdir -p -- "${output_path:h}"; then
    return 1
  fi

  # Keep the source file intact and write the sanitized copy separately.
  if ! command rm -f -- "${output_path}"; then
    return 1
  fi

  if ! command exiftool -q -q -all= -o "${output_path}" "${source_path}"; then
    return 1
  fi

  # Remove extended file attributes from the sanitized PDF file with `xattr`.
  if ! command xattr -c "${output_path}"; then
    return 1
  fi
}
