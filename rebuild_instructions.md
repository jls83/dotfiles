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
6. Install Node provider
    ```sh
    npm install -g neovim
    ```

### Language Server Setup
__NOTE:__ This may differ based on what you need for each machine. This is the current setup for the personal MacBook.

```sh
# Pyright
npm install -g pyright

# Typescript Language Server
npm install -g typescript-language-server

# Clojure LSP; We keep this separate from the `Brewfile`
brew install clojure-lsp/brew/clojure-lsp-native

# Rust Analyzer; note the platform type in the file name
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-apple-darwin.gz | \
gunzip -c - > ~/.local/bin/rust-analyzer && \
chmod +x ~/.local/bin/rust-analyzer

# clangd; comes along with LLVM in homebrew, keep this separate as well
brew install llvm
```

