ARROW=$'>>'
PROMPT=$'
%F{208}%D{%H:%M:%S}%f %~ $(git_prompt_info)\
%F{221}${ARROW}%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{5}:: "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{9}✘%F{5}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{2}✔%F{5}"
