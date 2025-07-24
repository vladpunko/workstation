# Load default completions.
autoload -Uz compinit

# Caching autocompletion.
if python3 -u - << EOF
import os, sys, time

try:
  sys.exit(time.time() - os.path.getmtime("${HOME}/.zcompdump") > 24 * 60 * 60)
except OSError:
  sys.exit(1)
EOF
then
  compinit -i
else
  compinit -C -i
fi

# Menu-like autocompletion selection.
zmodload -i zsh/complist

WORDCHARS=''

unsetopt beep

# Do not autoselect the first completion entry.
unsetopt menu_complete

# Allow users to see the entire output without any interruptions.
unsetopt flowcontrol

# Automatically list choices on ambiguous completion.
setopt auto_list

# Automatically use menu completion.
setopt auto_menu

# Move the cursor to the end if the word has only one match.
setopt always_to_end

# Allow tab completion to work on partial words.
setopt complete_in_word

# Navigate completions using the arrow keys.
zstyle ':completion:*' menu select

# Disable grouping of completion results by category for a flat list display.
zstyle ':completion:*' group-name ''

# Activate approximate matching in autocompletions.
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

# Case and hyphen insensitive.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors '=*=90'

# Enable caching to improve performance and responsiveness for commands with extensive or complex completions.
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_DIR}"
zstyle ':completion::complete:*' use-cache yes

# Show single ignored completion matches instead of hiding them.
zstyle '*' single-ignored show
