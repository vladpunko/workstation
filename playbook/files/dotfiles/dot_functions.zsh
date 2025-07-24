ff() {
  # Show the contents of the current working directory matching a given string pattern.
  find "${PWD}" -name "*$1*" -print | sort --reverse --ignore-case | "${PAGER}"
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
compdef g=git

gotoday() {
  local today
  today="$(date '+%Y-%m-%d')"

  # Create a new directory if it does not exist.
  mkdir -p -- "${today}"

  # Navigate into the date-stamped directory just created.
  cd -P -- "${today}" || return
}

o() {
  if [[ -z "$1" ]]; then
    # Open the current working directory in a new detached program session.
    detach open -- "${PWD}"
  else
    detach open -- "$@"
  fi
}
