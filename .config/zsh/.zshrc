## Path

typeset -gU PATH path fpath
path=( /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin $path )
export PATH

## add curl and openSSL to path as well

## Environmental variables

export PAGER='less'
export EDITOR='nvim'
export VISUAL='nvim'

export CLICOLOR=1 # use color in ls for *BSD

## Prompt

source "$ZDOTDIR/prompt.zsh"

## Options

setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt HIST_VERIFY # verify command history expansion
setopt INTERACTIVE_COMMENTS

setopt CORRECT
setopt CORRECT_ALL

setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

## Functions

wal () {
    python3 -m pywal -n -i $1
    wallpaper set $1

    # Set colors for Alacritty
    local head='^# BEGIN Colors (Pywal)$'
    local tail='^# END Colors (Pywal)$'
    sed -ibu -e '/'"$head"'/,/'"$tail"'/ { /'"$head"'/ { p; r '"$HOME/.cache/wal/colors-alacritty.yml" -e ' }; /'"$tail"'/ p; d; }' "$XDG_CONFIG_HOME/alacritty/alacritty.yml"
    \rm "$XDG_CONFIG_HOME/alacritty/alacritty.ymlbu" # remove the backup created by sed
}

## Aliases

source $ZDOTDIR/aliases.zsh

## Completion

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

compinit
_comp_options+=(globdots) # include hidden files in autocomplete

## Key bindings

bindkey -v # vim mode
bindkey -M menuselect '^[[Z' reverse-menu-complete # allow shift+tab in complete menu

KEYTIMEOUT=1 # shorter timeout for key sequences

## Load zsh-autosuggestions and zsh-syntax-highlighting

if type brew &>/dev/null; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
fi

## Customization

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )

#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES=( )

#ZSH_HIGHLIGHT_STYLES[default]=none
#ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
#ZSH_HIGHLIGHT_STYLES[commandseparator]=none
#ZSH_HIGHLIGHT_STYLES[path]=underline
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
#ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
#ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
#ZSH_HIGHLIGHT_STYLES[command-substitution]=none
#ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[process-substitution]=none
#ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
#ZSH_HIGHLIGHT_STYLES[back-quoted-argumentdelimiter]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[double-quoted-rgument]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=cyan
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
#ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=cyan
#ZSH_HIGHLIGHT_STYLES[assign]=none
#ZSH_HIGHLIGHT_STYLES[redirection]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
#ZSH_HIGHLIGHT_STYLES[named-fd]=none
#ZSH_HIGHLIGHT_STYLES[arg0]=fg=green

#export LSCOLORS='exgxcxdxfxegedabagacad' # for *BSD
#export LS_COLORS='di=34:ln=36:so=32:pi=33:ex=35:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43' # for GNU/Linux
