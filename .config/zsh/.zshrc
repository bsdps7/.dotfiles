## Path
typeset -gU PATH path fpath
path=( /usr/local/bin /usr/bin /bin /usr/sbin /sbin $path )
export PATH

## add the GNU version tools to PATH
path=( /usr/local/opt/{coreutils,findutils,grep}/libexec/gnubin $path )
export PATH

## Environmental variables
export EDITOR='vim'
export VISUAL='vim'

## Prompt
source $ZDOTDIR/prompt.zsh

## Options
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB

setopt CORRECT
setopt CORRECT_ALL

setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

## Functions
fpath=( /usr/local/share/zsh-completions $fpath )

## Aliases
source $ZDOTDIR/aliases.zsh

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

_comp_options+=(globdots) # include hidden files in autocomplete

## Key bindings

bindkey -v

[[ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
