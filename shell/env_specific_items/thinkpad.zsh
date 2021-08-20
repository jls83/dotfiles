# TODO: BIG TIME refactor is in order here.

export DOTNET_CLI_TELEMETRY_OUTPUT_OPTOUT=1

alias ipython='python -m IPython'
alias nvim='/home/jls83/appimages/nvim.appimage'

xclipCopy() {
    cat $1 | xclip -selection clipboard
}
alias wcp=xclipCopy

# PyEnv Junk
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="/home/jls83/.pyenv"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

GIT_REPOSITORIES=""
