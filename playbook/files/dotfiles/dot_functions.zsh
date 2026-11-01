ff() {
  # Show the contents of the current working directory matching a given string pattern.
  # Split the value of `PAGER` so commands such as `less -R` run with their arguments.
  command find "${PWD}" -name "*$1*" -print | command sort --reverse --ignore-case | ${=PAGER}
}

g() {
  if [[ -z "$1" ]]
  then
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
  if ! builtin cd -P -- "${today}"
  then
    return 1
  fi
}

o() {
  if [[ -z "$1" ]]
  then
    # Open the current working directory in a new detached program session.
    command detach open -- "${PWD}"
  else
    command detach open -- "$@"
  fi
}

pdfsanitize() {
  # Avoid keeping a backup with the original metadata.
  if ! command exiftool -all= -overwrite_original -- "$1"
  then
    return 1
  fi

  # Remove attributes that reveal where the file came from.
  command xattr -c -- "$1"
}
