# Make the current file executable with a short `chmod +x` shortcut.
alias -- +x='chmod +x'

# Remove Python bytecode files and `__pycache__` directories from the current
# working tree.
alias pyclean='find "${PWD}" \( -name "*.py[cod]" -o -name "__pycache__" \) -exec rm -f -r {} +'

# Start `IPython` explicitly through `python3` so it follows the active Python
# environment on this machine.
alias ipython='python3 -c "import IPython; IPython.terminal.ipapp.launch_new_instance()"'

# Force `pyenv` builds to use `clang`, which matches the macOS toolchain on
# this workstation.
alias pyenv='env CC=clang pyenv'

# Route bare `python` calls to `python3`.
alias python='python3'

# Move one directory up.
alias ..='cd ..'

# Move two directories up.
alias ...='cd ../..'

# Move three directories up.
alias ....='cd ../../..'

# Move four directories up.
alias .....='cd ../../../..'

# Jump back to the previous working directory.
alias -- -='cd -'

# Protect `rm` with interactive prompts and disable zsh spell correction for
# destructive deletions.
alias rm='nocorrect rm -I -R'

# Use colored `ls` output with the macOS `-G` flag.
alias ls='ls -G'

# Show all files, including dotfiles, with detailed colored `ls` output.
alias la='ls -A -F -G -h -l'

# Keep `grep` output colorized when matches are printed.
alias grep='grep --color=auto'

# Attach to an existing `tmux` session or create a new one when none exists.
alias tm='tmux attach || tmux new-session'

# Start the preferred `mc` file manager with the local color and mouse
# settings.
alias mc='mc --color --nomouse --skin=modarin256'

# Start `htop` with the preferred sorting and mouse behavior for this
# workstation.
alias htop='htop --no-mouse --delay=10 --sort-key=PERCENT_MEM'

# Clear the visible terminal buffer and reset the current screen.
alias dropout='printf "\\033c\\033[3J"'

# Print each `PATH` entry on its own line for easier inspection.
alias paths='print -l -- ${(s/:/)PATH}'

# Fetch the current public IP address with a quiet but failure-aware `curl`
# invocation.
alias myip='curl --disable --fail --silent --show-error https://checkip.amazonaws.com'

# Strip trailing newlines from stdin and copy the result to the macOS
# clipboard.
alias copyline='tr -d "\\n" | pbcopy'

# Reset the current terminal session.
alias r='reset'

# Copy a compact timestamp like `YYYYMMDDHHMM` to the clipboard.
alias zetid='date "+%Y%m%d%H%M" | tr -d "\\n" | pbcopy'
