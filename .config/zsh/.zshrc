## Path
typeset -gU PATH path fpath
path=( /usr/local/bin /usr/bin /bin /usr/sbin /sbin $path )
export PATH

## add the GNU version tools to PATH
path=( /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/findutils/libexec/gnubin /usr/local/opt/grep/libexec/gnubin $path )
export PATH

## Environmental variables
export EDITOR='vim'
export VISUAL='vim'

## Prompt
autoload -U colors
colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

## Options
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB

setopt CORRECT
setopt CORRECT_ALL

setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

HISTFILE="$ZDOTDIR/.zsh_hitory"
HISTSIZE=1000
SAVEHIST=1000

## Functions
fpath=( /usr/local/share/zsh-completions $fpath )

## Aliases
alias dgit='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # dotfile git

alias ls='ls -a --color'
alias ll='ls -la --color'
alias md='mkdir -p'
alias rm='rm -i'
alias cp='cp -i'

autoload -Uz compinit
compinit

## Key bindings

bindkey -v

[[ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
