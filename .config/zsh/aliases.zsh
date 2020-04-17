alias mkdir='mkdir -pv'
alias rm='rm -iv'
alias cp='cp -iv'
alias e="$EDITOR"
alias v="$VISUAL"

alias ls='ls -a'
alias ll='ls -la'
if ls --color=auto &>/dev/null; then # GNU
    alias ls='ls -a --color=auto'
    alias ls='ls -la --color=auto'
fi

alias dgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # dotfiles
