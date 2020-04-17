autoload -U colors
colors

setopt PROMPT_SUBST
prompt_newline=$'\n%{\r%}'
prompt_symbol='%#'

set_prompt () {
  local user="%(!.%F{magenta}.%F{blue})%n@%m%f"  # color coded magenta if privileged
  local dir="%F{magenta}%~%f"
  local prompt="%(?.%F{cyan}.%F{09})$prompt_symbol%f"

  echo "${user} ${dir} ${prompt} "

  #local dir="%F{blue}%~%f"
  #local prompt="%F{cyan}$%f"
  #local vcs_info="%F{magenta}Ymaster* |54%f"
  #echo "${dir} ${vcs_info} ${prompt} "  
}

PS1="$(set_prompt)"
