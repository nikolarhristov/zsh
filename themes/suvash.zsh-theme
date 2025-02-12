function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo 'Hg' && return
  echo '○'
}

function virtualenv_info {
  [[ -n "$VIRTUAL_ENV" ]] && echo '('${VIRTUAL_ENV:t}') '
}

PROMPT='%F{magenta}%n%f at %F{yellow}%m%f in %B%F{green}%~%f%b$(git_prompt_info)$(ruby_prompt_info)
$(virtualenv_info) $(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX=' on %F{magenta}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%f'
ZSH_THEME_GIT_PROMPT_DIRTY='%F{green}!'
ZSH_THEME_GIT_PROMPT_UNTRACKED='%F{green}?'
ZSH_THEME_GIT_PROMPT_CLEAN=''

ZSH_THEME_RUBY_PROMPT_PREFIX=' using %F{red}'
ZSH_THEME_RUBY_PROMPT_SUFFIX='%f'
