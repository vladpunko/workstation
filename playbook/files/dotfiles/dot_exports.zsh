# Point `virtualenvwrapper` at the main `python3` interpreter from Miniconda.
export VIRTUALENVWRAPPER_PYTHON="${HOME}/.miniconda/bin/python3"

# Prevent Python from creating `.pyc` files automatically.
export PYTHONDONTWRITEBYTECODE=1

# Force UTF-8 for Python standard input and output streams.
export PYTHONIOENCODING=UTF-8

# Load the interactive Python startup script from `~/.pythonrc.py`.
export PYTHONSTARTUP="${HOME}/.pythonrc.py"

# Keep the shell prompt minimal.
export PROMPT='$ '

# Declare `zsh` as the primary interactive shell.
export SHELL=/bin/zsh

# Use `en_US.UTF-8` as the default locale language.
export LANG=en_US.UTF-8

# Keep localized message selection aligned with `en_US.UTF-8`.
export LANGUAGE=en_US.UTF-8

# Force all locale categories to `en_US.UTF-8`.
export LC_ALL=en_US.UTF-8

# Store zsh history in `~/.zsh_history`.
export HISTFILE="${HOME}/.zsh_history"

# Keep up to 65535 commands in memory during the session.
export HISTSIZE=65535

# Persist up to 65535 commands on disk.
export SAVEHIST=65535

if [[ -z "${TMUX}" ]]; then
  # Advertise a regular 256-color terminal outside `tmux`.
  export TERM=xterm-256color
else
  # Advertise a `tmux`-compatible 256-color terminal inside `tmux`.
  export TERM=screen-256color
fi

# Set the BSD `ls` color palette used by `LSCOLORS`.
export LSCOLORS='Gxfxcxdxbxegedabagacad'

# Ask supported terminal programs to emit colored output.
export CLICOLOR=1

# Use `vim` as the fallback editor for programs that honor
# `ALTERNATE_EDITOR`.
export ALTERNATE_EDITOR=vim

# Use `vim` as the default command-line editor.
export EDITOR=vim

# Use `vim` as the visual full-screen editor.
export VISUAL=vim

# Configure `less` with the preferred flags for interactive paging.
export LESS='-X -F -R -i'

# Use `less` for manual pages.
export MANPAGER=less

# Use `less` as the default pager.
export PAGER=less

# Bind GnuPG to the current terminal so `pinentry` prompts appear in the active
# session.
# See information: https://stackoverflow.com/questions/39494631
GPG_TTY="$(tty)"; export GPG_TTY

# Set the default `fzf` layout and display behavior.
export FZF_DEFAULT_OPTS='--height=50% --info=inline --layout=reverse'

# Make `zoxide` print the destination directory after each jump.
export _ZO_ECHO=1

# Prevent Homebrew from gathering analytics.
export HOMEBREW_NO_ANALYTICS=1

# Stop Homebrew from auto-updating before regular commands.
export HOMEBREW_NO_AUTO_UPDATE=1
