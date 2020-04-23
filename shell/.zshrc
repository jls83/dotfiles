# TODO:
#   * Break out computer-specific files (ycharts, personal_macbook, linux)
source ~/.bash_profile
source ~/.fzf_items

# Custom alias functions
maccopy() {
    cat $1 | pbcopy
}

xclipCopy() {
    cat $1 | xclip -selection clipboard
}

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

openVgShell() {
    previous_dir=$(pwd);
    cd /sites/ycharts;
    vagrant ssh bionic -- -t \
        "source /home/vagrant/.virtualenvs/ycharts/bin/activate;" \
        "source /home/vagrant/.vagrant_bash_profile_local;" \
        "python /sites/ycharts/manage.py shell_plus";
    cd $previous_dir;
}

openVgTmux() {
    previous_dir=$(pwd);
    SESSION_NAME="ycSession"

    # Possible error messages to handle
    NO_SERVER_RUNNING="no server running"
    NO_SESSIONS="no sessions"

    echo "Checking for $SESSION_NAME...";
    cd /sites/ycharts;
    session_list_result=$(vagrant ssh bionic -- -t "tmux ls" 2>&1);
    if [[ $session_list_result != *$SESSION_NAME* ]] \
        || [[ $session_list_result == *$NO_SERVER_RUNNING* ]] \
        || [[ $session_list_result == *$NO_SESSIONS* ]]; then
        echo "No $SESSION_NAME created, creating new session...";
        # Redirect stderr to /dev/null so we don't get a "connection closed" message
        vagrant ssh bionic -- -t "tmux new -d -s $SESSION_NAME" 2>/dev/null;
    else
        echo "Found $SESSION_NAME session, connecting...";
    fi
    vagrant ssh bionic -- -t "tmux attach -t $SESSION_NAME";

    cd $previous_dir;
}

ychartsSshFzf() {
    previous_dir=$(pwd);
    
    # If we already had the virtualenv activated, don't deactivate on exit
    if [[ -z "$VIRTUAL_ENV" ]] then
        should_deactivate=true;
    else
        should_deactivate=false;
    fi

    SERVER_ENVIRONMENTS=(production staging);
    SERVER_GROUPS=(alerts_worker chart companies_admin daily_data_import_admin indicators_admin \
                   latest_worker main_admin main_worker mixpanel_worker portfolios_worker web);

    SERVER_ENVIRONMENT=$( IFS=$'\n'; echo "${SERVER_ENVIRONMENTS[*]}" | fzf);
    SERVER_GROUP=$( IFS=$'\n'; echo "${SERVER_GROUPS[*]}" | fzf);

    cd /sites/ycharts_systems;
    source /sites/ycharts_systems/.env;
    /sites/ycharts_systems/ycharts_ssh $SERVER_ENVIRONMENT $SERVER_GROUP;

    if [[ "$should_deactivate" = true ]] deactivate;
    cd $previous_dir;
}

gitQuicksave() {
    MSG=$(git checkout -b tmp 2>&1)
    if [[ $MSG == "fatal: A branch named 'tmp' already exists." ]]; then
        echo "'tmp' already exists; deleting";
        git branch -D tmp;
        git checkout -b tmp;
    fi
}

mkdirAndCd() {
    mkdir -p $1 && cd $1
}

case `uname` in
    "Darwin")
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

# Both Linux and Mac have themes called `crcandy_edit`
ZSH_THEME="crcandy_edit"

# I use the FZF items everywhere
alias gh=fzfGitLocalBranches
alias ghr=fzfGitAllBranches
alias repos=fzfGitViewAndCdAll
alias yre=fzfGitViewAndCdYCharts

# I also use mkdirAndCd everywhere
alias mkcd=mkdirAndCd

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias qs=gitQuicksave

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Use this so I can override as needed
export EDITOR="nvim"

# TODO Put this in its proper place
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

alias yssh=ychartsSshFzf
