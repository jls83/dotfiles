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
4. Add the appropriate `MACHINE_TYPE` to the `~/.bash_profile` file
    ```sh
    # NOTE: See the .zshrc file for suppored MACHINE_TYPE options
    echo "MACHINE_TYPE=personal" >> ~/.bash_profile
    ```
5. Install `oh-my-zsh`
    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
6. Run `stow` to get all dotfiles in place
    ```sh
    for SUB_DIR in $(fd . --type directory --max-depth 1 ~/other_projects/dotfiles)
    do
        stow -d ~/other_projects/dotfiles -t ~ $(basename $SUB_DIR)
    done
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
    virtualenv --python=$HOME/.pyenv/versions/3.7.11/bin/python3 ~/.virtualenvs/py3nvim
    workon py3nvim && pip install pynvim
    ```
4. Install Node provider
    ```sh
    npm install -g neovim
    ```
5. Install `packer.nvim`
    ```sh
    # Copied from the packer.nvim README: https://github.com/wbthomason/packer.nvim#quickstart
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```
6. Install all NeoVim plugins
    ```sh
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    ```

### Language Server Setup
This used to be manual, but mason.nvim takes care of all of this!
