source ~/.bash_profile
source ~/aliases/aliases.zsh
source ~/aliases/fzf_items.zsh

plugins=(
  git
  virtualenv
)

export EDITOR="nvim"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/jls83/.oh-my-zsh"
export ZSH_THEME="crcandy_edit"
source $ZSH/oh-my-zsh.sh


# Source all of the environment specific files here
case `uname` in
    "Darwin")
        # There are certain items that are global for all Mac computers
        source ~/env_specific_items/all_macbooks
        # I set a $MACHINE_TYPE env variable in the local bash_profile files
        case "$MACHINE_TYPE" in
            "personal")
                source ~/env_specific_items/personal_macbook
            ;;
            "work")
                source ~/env_specific_items/work_macbook
            ;;
        esac
        ;;
    "Linux")
        source ~/env_specific_items/thinkpad
    ;;
esac


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

AUTOENV_ENABLE_LEAVE="True"

# TODO: Father forgive me
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[ -f "/Users/jls83/.ghcup/env" ] && source "/Users/jls83/.ghcup/env" # ghcup-env

countdownThing() {
    seconds=$1
    while [ $seconds -gt 0 ]; do
       echo -ne "$seconds\033[0K\r"
       sleep 1
       : $((seconds--))
    done
}

export PATH="/usr/local/opt/llvm/bin:$PATH"

# TODO: Ehhhhh
export LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include"

# Created by `pipx` on 2021-08-20 01:41:41
export PATH="$PATH:/Users/jls83/.local/bin"

# TODO: Make this machine-type specific
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/Users/jls83/.local/pipx/venvs/virtualenvwrapper/bin/python
export VIRTUALENVWRAPPER_SCRIPT=/Users/jls83/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper.sh
source /Users/jls83/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper_lazy.sh
