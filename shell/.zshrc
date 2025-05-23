source ~/.bash_profile
source ~/.zprofile

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
export ZSH_THEME="crcandy_edit_local"

# Source all of the environment-specific files here
case `uname` in
    "Darwin")
        # There are certain items that are global for all Mac computers
        source ~/env_specific_items/all_macbooks.zsh
        # I set a $MACHINE_TYPE env variable in the local bash_profile files
        case "$MACHINE_TYPE" in
            "personal") source ~/env_specific_items/personal_macbook.zsh ;;
            "work") source ~/env_specific_items/work_macbook.zsh ;;
        esac
    ;;
    "Linux")
        # I set a $MACHINE_TYPE env variable in the local bash_profile files
        case "$MACHINE_TYPE" in
            "glinux") source ~/env_specific_items/glinux.zsh ;;
            "banana") source ~/env_specific_items/thinkpad.zsh ;;
        esac
    ;;
esac

# Make sure to source this after `ZSH_THEME` is set.
source $ZSH/oh-my-zsh.sh

AUTOENV_ENABLE_LEAVE="True"

# Various PATH additions not suitable elsewhere
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.ghcup/env ] && source $HOME/.ghcup/env

# PyEnv-specific items
export PATH="$HOME/.pyenv:$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init - --no-rehash)"

# virtualenvwrapper-specific items
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$HOME/.local/pipx/venvs/virtualenvwrapper/bin/python
export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper.sh
source $HOME/.local/pipx/venvs/virtualenvwrapper/bin/virtualenvwrapper_lazy.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/jls83/.bun/_bun" ] && source "/Users/jls83/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/jls83/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
