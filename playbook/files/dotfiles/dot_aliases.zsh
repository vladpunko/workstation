alias -- +x='chmod +x'

# Start a proper python interpreter regarding the working user's environment on the current machine.
alias ipython='python3 -c "import IPython; IPython.terminal.ipapp.launch_new_instance()"'

alias pyclean='find "${PWD}" -name "*.py[cod]" -o -name "__pycache__" -exec rm -f -r {} +'

# Build and install new python interpreters on the current machine.
alias pyenv='env CC=clang pyenv'

alias python='python3'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias -- -='cd -'

# Protect deletions with interactive prompts and disable spell-check to prevent errors.
alias rm='nocorrect rm -I -R'

alias ls='ls --color=auto'

# Show all files in the current working directory with their details.
alias la='ls -A -F -h -l'

alias grep='grep --color=auto'

# Connect or create a new working tmux session.
alias tm='tmux attach || tmux new-session'

# Create a new working session of the preferred file manager on the current machine.
alias mc='mc --color --nomouse --skin=modarin256'

# Create a new working session of the preferred process viewer on the current machine.
alias htop='htop --no-mouse --delay=10 --sort-key=PERCENT_MEM'

# Drop all previous output in the current interactive session.
alias dropout='echo -e -n "\\033c\\033[3J"'

# Show each path on a separate line where the current operating system will search for executables when running a command.
alias paths='echo -e "${PATH//:/\\n}"'

# Get information about the public network address assigned to the current machine.
alias myip='curl --disable "https://checkip.amazonaws.com"'

# Trim new lines and copy data to the system clipboard.
alias copyline='tr -d "\\n" | pbcopy'

alias r='reset'
