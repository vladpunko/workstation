# Load default completions.
autoload -Uz compinit

# Keep the completion cache in a predictable location under
# `${XDG_CACHE_HOME}/zsh`.
command mkdir -p -- "${XDG_CACHE_HOME}/zsh"

# Caching autocompletion.
# Use `python3` here because the file-age check is clearer than the zsh glob
# qualifier equivalent and keeps the `compinit` cache logic portable across
# macOS setups.
if command python3 -u - "${HOME}/.zcompdump" <<'EOF'
import sys
import time
from pathlib import Path

path = Path(sys.argv[1])

try:
    if time.time() - path.stat().st_mtime <= 24 * 60 * 60:
        raise SystemExit(0)
except OSError:
    pass

raise SystemExit(1)
EOF
then
  compinit -C -i
else
  compinit -i
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

# Enable caching to improve performance and responsiveness for commands with
# extensive or complex completions.
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME}/zsh"
zstyle ':completion::complete:*' use-cache yes

# Show single ignored completion matches instead of hiding them.
zstyle '*' single-ignored show
