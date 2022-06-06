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

ripgrepWithPager() {
    rg -p $@ | less
}

diffWithDelta() {
    diff -u $1 $2 | delta
}

getLinesInRange() {
    # Gets the lines between line $2 and $3 in the file at $1.
    sed -n -e "$2,$3 p" -e "$3 q" $1;
}

# TODO: Utils file?
countdownThing() {
    seconds=$1
    while [ $seconds -gt 0 ]; do
       echo -ne "$seconds\033[0K\r"
       sleep 1
       : $((seconds--))
    done
}

# TODO: Utils file?
convertMarkdownToDocx() {
    pandoc -t docx $1 -o $2 --highlight-style tango
}

####################
# EXPORTED ALIASES #
####################

alias ddiff=diffWithDelta
alias gitr='git checkout develop && git pull origin develop'
alias ht=getLinesInRange
alias mkcd=mkdirAndCd
alias npr=prFunc
alias qs=gitQuicksave
alias rgp=ripgrepWithPager
