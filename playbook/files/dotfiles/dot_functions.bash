archive() {
  # Create a new archive from determined files using the concurrent data compression method on the current machine.
  tar --create --ignore-failed-read --use-compress-program=pigz --verbose --file=archive.tar.gz -- "$@"
}

g() {
  if [[ -z "$1" ]]; then
    # Show the current user's name and email address in the main working tree.
    printf "%s <%s>\\n" "$(git config user.name)" "$(git config user.email)"

    # Show the working tree status.
    git status --branch --short
  else
    git "$@"
  fi
}

mkcd() {
  # Create and change the current working directory at the same time.
  mkdir --parents --verbose -- "$1" && cd -P -- "$1" || return
}

o() {
  if [[ -z "$1" ]]; then
    # Open the current working directory in a new detached program session.
    detach "${BASH_ALIASES[open]:-open}" "${PWD}"
  else
    detach "${BASH_ALIASES[open]:-open}" "$@"
  fi
}

pyformatting() {
  # Format all input files and sort python import definitions within logical sections.
  black --line-length=100 -- "$@" && isort --filter-files --profile=black -- "$@"
}

where() {
  # Show the contents of the current working directory matching a given string pattern.
  find "${PWD}" -name "*$1*" -print | sort --reverse --ignore-case | "${PAGER}"
}
