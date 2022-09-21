# Most setting from https://scriptingosx.com/2019/11/new-book-release-day-moving-to-zsh/

# Path to dotfiles repo
export DOTFILES_REPO_PATH="${HOME}/Repos/lofgrenfredrik/dotfiles"

# Terminal editor
export EDITOR=/usr/bin/nano

# prevent duplicate entries in path
declare -U path

# PATH
path+=~/bin

### HISTORY ###
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
SAVEHIST=5000
HISTSIZE=2000

# dont't add to history if first character is a space
setopt HIST_IGNORE_SPACE

# share history across multiple zsh sessions
setopt SHARE_HISTORY

# append to history
setopt APPEND_HISTORY

# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# do not store duplications
setopt HIST_IGNORE_DUPS

#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Verify before run
setopt HIST_VERIFY


### MISC SETTINGS ###
# Globbing case-insensitive
setopt NO_CASE_GLOB

# List globb matches
setopt GLOB_COMPLETE

# Tab selection option
setopt AUTO_MENU

# don't play sound, SILENCIO!!
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP

### COLORS ###
# Activate color for ls
export CLICOLOR=1
# Custom colors
export LSCOLORS=gxfxcxhxbxegedabagacad

### COMPLETION ###
# Match colors in LSCOLORS
zstyle ':completion:*:default' list-colors 'di=36:ln=35:so=32:pi=37:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# list with colors
zstyle ':completion:*' list-colors ''

# load completion
autoload -Uz compinit && compinit

# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

# Alias
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# Functions
if [ -f ~/.zsh_functions ]; then
	. ~/.zsh_functions
fi

# ### PURE PROMPT ###
# # https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
