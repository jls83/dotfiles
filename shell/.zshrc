source ~/.bash_profile

source ~/aliases/aliases.zsh
source ~/aliases/fzf_items.zsh

export EDITOR="nvim"

# ZSH-specific items
plugins=(
  git
  virtualenv
)

ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="crcandy_edit"
source $ZSH/oh-my-zsh.sh

# Source all of the environment-specific files here
case `uname` in
    "Darwin")
        # There are certain items that are global for all Mac computers
        source ~/env_specific_items/all_macbooks.zsh
        # I set a $MACHINE_TYPE env variable in the local bash_profile files
        case "$MACHINE_TYPE" in
            "personal")
                source ~/env_specific_items/personal_macbook.zsh
            ;;
            "work")
                source ~/env_specific_items/work_macbook.zsh
            ;;
        esac
        ;;
    "Linux")
        source ~/env_specific_items/thinkpad.zsh
    ;;
esac

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

AUTOENV_ENABLE_LEAVE="True"

# Various PATH additions not suitable elsewhere
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

[ -f $HOME/.ghcup/env ] && source $HOME/.ghcup/env

# Workaround for pyenv/bzip2/zlib issue: https://github.com/pyenv/pyenv/issues/1746#issuecomment-738749297
export LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include"

# TODO: Make this machine-type specific
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$HOME/.local/pipx/venvs/virtualenvwrapper/bin/python
export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper.sh
source $HOME/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper_lazy.sh
