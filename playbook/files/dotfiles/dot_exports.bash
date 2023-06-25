export PYENV_ROOT="${HOME}/.pyenv"

# Set the main settings for all python interpreters.
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING=UTF-8

export PATH="${PYENV_ROOT}/bin:${HOME}/.miniconda/bin:${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin${PATH:+:${PATH}}"

# Set the full path used to execute the current instance of the main interactive system.
export SHELL=/bin/bash

# Set the main path to store user's settings on the current machine.
export XDG_CONFIG_HOME="${HOME}/.config"

# Set the main path where user-specific cached data should be written on the current machine.
export XDG_CACHE_HOME="${HOME}/.cache"

# Set the main path where user-specific data files should be written on the current machine.
export XDG_DATA_HOME="${HOME}/.local/share"

# Set the main path where user-specific state files should be written on the current machine.
export XDG_STATE_HOME="${HOME}/.local/state"

# Set the main path where user-specific non-essential runtime files should be written on the current machine.
export XDG_RUNTIME_DIR="/run/user/${UID}"

# Set the main encoding for the current operating system.
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set the main settings for the history storage of the executed commands.
export HISTCONTROL=ignoredups
export HISTSIZE=65535
export SAVEHIST=65535

if [[ -z "${TMUX}" ]]; then
  # Update information about the main terminal emulator for the current interactive session.
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

# Set the main color palette for the preferred interactive system.
eval -- "$(dircolors --bourne-shell)"

# Set the user's preferred prompt string for the working operating system on the current machine.
export PS1="\\[\\033[32;1m\\]\\u@\\H\\[\\033[m\\]:\\[\\033[34;1m\\]\\W\\[\\033[0m\\]\\$ "

# Show the exit code of the last user's command in the current interactive session.
export PROMPT_COMMAND='echo "return status: $?"'

# Set the main text editor for the current operating system.
export ALTERNATE_EDITOR=emacs
export EDITOR=emacswrapper
export VISUAL=emacswrapper

# Set the main pager for the current operating system.
export LESS='-i -X -F -R'
export MANPAGES=less
export PAGER=less

# Fix the issue with the preferred encryption program on the current machine.
# See information: https://stackoverflow.com/questions/39494631
GPG_TTY="$(tty)"; export GPG_TTY

# Set the standard arguments for the preferred command-line fuzzy finder on the current machine.
export FZF_DEFAULT_OPTS='--height=50% --info=inline --layout=reverse'
