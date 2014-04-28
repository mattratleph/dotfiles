# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{$fg[blue]%}±%{$reset_color%}"
  else
    echo "%{$reset_color%}%#"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='
%{$bg[black]$fg_bold[green]%}%n%{$fg_bold[blue]%}@%{$fg_bold[cyan]%}%m %{$reset_color%}%{$bg[black]$fg[yellow]%}%~%{$fg[green]%}$(git_prompt_info) %{$reset_color$fg[black]%}⮀
$(_prompt_char) '
