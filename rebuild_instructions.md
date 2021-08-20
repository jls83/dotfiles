## Top-Level Setup
1. Get Homebrew:
    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
2. Clone this repo to the target machine. NOTE: You will need an SSH key for GitHub access:
    ```sh
    mkdir -p ~/other_projects && cd ~/other_projects && git clone git@github.com:jls83/dotfiles.git
    ```
3. Install all homebrew-related items:
    ```sh
    brew bundle --file=~/other_projects/dotfiles/homebrew/Brewfile
    ```
4. Run `stow` to get all dotfiles in place
    ```sh
    # NOTE I know there is a better way to do this.
    stow -d ~/other_projects/dotfiles -t ~ git
    stow -d ~/other_projects/dotfiles -t ~ homebrew
    stow -d ~/other_projects/dotfiles -t ~ intellij
    stow -d ~/other_projects/dotfiles -t ~ shell
    stow -d ~/other_projects/dotfiles -t ~ taskwarrior
    stow -d ~/other_projects/dotfiles -t ~ tmux
    stow -d ~/other_projects/dotfiles -t ~ vim
    stow -d ~/other_projects/dotfiles -t ~ yabai
    ```

## NeoVim Setup
1. Install an appropriate version of Python for use in NeoVim
    ```sh
    pyenv install 3.7.11
    ```
2. Install `virtualenv` & `virtualenvwrapper`
    ```sh
    pipx install virtualenv
    pipx install virtualenvwrapper
    ```
3. Create a virtualenv for NeoVim & install `pynvim`
    ```sh
    virtualenv --python=/Users/jls83/.pyenv/versions/3.7.11/bin/python3 ~/.virtualenvs/py3nvim
    workon py3nvim && pip install pynvim
    ```
4. Install `vim-plug`:
    ```sh
    # Copied from the vim-plug README: https://github.com/junegunn/vim-plug/blob/master/README.md#unix-linux
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```
5. Install all NeoVim plugins
    ```sh
    nvim +PlugInstall +qall
    ```
