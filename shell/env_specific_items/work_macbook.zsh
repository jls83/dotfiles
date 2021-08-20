export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# PyEnv junk
export PATH="/Users/jls83/.pyenv:$PATH"
eval "$(pyenv init - --no-rehash)"

# Haskell junk
export PATH="/Users/jls83/.ghcup/bin:$PATH"

###################
# ALIAS FUNCTIONS #
###################

openVgShell() {
    previous_dir=$(pwd);
    cd /sites/ycharts;
    vagrant ssh bionic -- -t \
        "source /home/vagrant/.virtualenvs/ycharts/bin/activate;" \
        "source /home/vagrant/.vagrant_bash_profile_local;" \
        "python /sites/ycharts/manage.py shell_plus";
    cd $previous_dir;
}
alias vgs=openVgShell

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
alias vgt=openVgTmux

ychartsSshFzf() {
    previous_dir=$(pwd);
    
    # If we already had the virtualenv activated, don't deactivate on exit
    if [[ -z "$VIRTUAL_ENV" ]] then
        should_deactivate=true;
    else
        should_deactivate=false;
    fi

    SERVER_ENVIRONMENTS=(production staging);
    SERVER_GROUPS=(alerts_worker node companies_admin daily_data_import_admin indicators_admin \
                   latest_worker main_admin main_worker mixpanel_worker portfolios_worker web);

    SERVER_ENVIRONMENT=$( IFS=$'\n'; echo "${SERVER_ENVIRONMENTS[*]}" | fzf);
    SERVER_GROUP=$( IFS=$'\n'; echo "${SERVER_GROUPS[*]}" | fzf);

    cd /sites/ycharts_systems;
    source /sites/ycharts_systems/.env;
    /sites/ycharts_systems/ycharts_ssh $SERVER_ENVIRONMENT $SERVER_GROUP;

    if [[ "$should_deactivate" = true ]] deactivate;
    cd $previous_dir;
}
alias yssh=ychartsSshFzf

fzfGitViewAndCdAll() {
    DIRS=("/sites" "/Users/jls83/other_projects")
    fzfDirectorySwitcher $DIRS
}
alias repos=fzfGitViewAndCdAll

fzfGitViewAndCdYCharts() {
    DIRS=("/sites")
    fzfDirectorySwitcher $DIRS
}
alias yre=fzfGitViewAndCdYCharts

convertMarkdownToDocx() {
    pandoc -t docx $1 -o $2 --highlight-style tango
}

runManagementCommand() {
    all_management_commands=$(fd "management/commands.*py" -p -E '__init__*' -E '__pycache__')
    management_command_with_path=$(echo $all_management_commands | fzf)
    management_command=$(basename -s .py $management_command_with_path)

    previous_dir=$(pwd);
    cd /sites/ycharts;
    vagrant ssh bionic -- -t \
        "source /home/vagrant/.virtualenvs/ycharts/bin/activate;" \
        "source /home/vagrant/.vagrant_bash_profile_local;" \
        "python /sites/ycharts/manage.py $management_command";
    cd $previous_dir;
}

#################
# OTHER ALIASES #
#################

# YCharts-specific aliases
alias vg='cd /sites/ycharts && vagrant ssh bionic'
alias ycs='cd /sites/ycharts'

export GOPATH="/Users/jls83/other_projects/go_projects"
