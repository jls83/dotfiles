source ~/.bash_profile
source ~/.fzf_items

plugins=(
  git
  virtualenv
  poetry
)

export EDITOR="nvim"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/jls83/.oh-my-zsh"
export ZSH_THEME="crcandy_edit"
source $ZSH/oh-my-zsh.sh

##########################
# GLOBAL ALIAS FUNCTIONS #
##########################
# TODO: Make this generic
prFunc() {
    previous_dir=$(pwd);
    cd /sites/ycharts;

    github_base_url="https://github.com/ycharts/ycharts/compare/develop...jls83:";
    current_branch=$(git branch | grep \* | cut -d ' ' -f2);
    open -na "Google Chrome" "$github_base_url$current_branch";

    if [[ $1 != 'no' ]]; then
        $EDITOR ~/pr.md;
        cat ~/pr.md | pbcopy;
    fi

    cd $previous_dir;
}
alias npr=prFunc

gitQuicksave() {
    MSG=$(git checkout -b tmp 2>&1)
    if [[ $MSG == "fatal: A branch named 'tmp' already exists." ]]; then
        echo "'tmp' already exists; deleting";
        git branch -D tmp;
        git checkout -b tmp;
    fi
}
alias qs=gitQuicksave

mkdirAndCd() {
    mkdir -p $1 && cd $1
}
alias mkcd=mkdirAndCd

openInPyCharm() {
    open -a PyCharm $1
}
alias pych=openInPyCharm

ripgrepWithPager() {
    rg -p $1 | less
}
alias rgp=ripgrepWithPager

diffWithDelta() {
    diff -u $1 $2 | delta
}
alias ddiff=diffWithDelta

getLinesInRange() {
    # Gets the lines between line $2 and $3 in the file at $1.
    sed -n -e "$2,$3 p" -e "$3 q" $1;
}
alias ht=getLinesInRange

#################
# OTHER ALIASES #
#################
alias gitr='git checkout develop && git pull origin develop'

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

# TODO: Put this in an appropriate place
fzfFetchRemote() {
    git fetch $(git remote -v | awk '{print $1}' | uniq | fzf)
}
alias gfr=fzfFetchRemote

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
