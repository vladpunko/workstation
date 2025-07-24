export VIRTUALENVWRAPPER_PYTHON="${HOME}/.miniconda/bin/python3"

# Set the main settings for all python interpreters.
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING=UTF-8
export PYTHONSTARTUP="${HOME}/.pythonrc.py"

# Set the user's preferred prompt string for the working operating system on the current machine.
export PROMPT='$ '

# Set the full path used to execute the current instance of the main interactive system.
export SHELL=/bin/zsh

# Set the main encoding for the current operating system.
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set the main settings for the history storage of the executed commands.
export HISTSIZE=65535
export SAVEHIST=65535

if [[ -z "${TMUX}" ]]; then
  # Update information about the main terminal emulator for the current interactive session.
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

# Set the main color palette for the preferred interactive system.
export LSCOLORS='Gxfxcxdxbxegedabagacad'

# Enable colored output for terminal commands.
export CLICOLOR=1

# Set the main text editor for the current operating system.
export ALTERNATE_EDITOR=vim
export EDITOR=vim
export VISUAL=vim

# Set the main pager for the current operating system.
export LESS='-X -F -R -i'
export MANPAGES=less
export PAGER=less

# Fix the issue with the preferred encryption program on the current machine.
# See information: https://stackoverflow.com/questions/39494631
GPG_TTY="$(tty)"; export GPG_TTY

# Set the standard arguments for the preferred command-line fuzzy finder on the current machine.
export FZF_DEFAULT_OPTS='--height=50% --info=inline --layout=reverse'

# Prevent homebrew from gathering analytics.
export HOMEBREW_NO_ANALYTICS=1

# Do not automatically update homebrew before running some commands.
export HOMEBREW_NO_AUTO_UPDATE=1
