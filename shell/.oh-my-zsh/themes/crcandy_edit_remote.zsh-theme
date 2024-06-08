THEME_GREY="$FG[102]"
THEME_YELLOW="$FG[226]"
THEME_GREEN="$FG[040]"

ARROW="${THEME_GREEN}>>%{$reset_color%}"
CLOCK="${THEME_YELLOW}%D{%H:%M:%S}%{$reset_color%}"
DIRECTORY="%~"

PROMPT=$'
${CLOCK} ${DIRECTORY} $(virtualenv_prompt_info) $(git_prompt_info) \
${ARROW} '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{5}:: "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{9}✘%F{5}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{2}✔%F{5}"

ZSH_THEME_VIRTUALENV_PREFIX="${THEME_GREY}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%{$reset_color%}"