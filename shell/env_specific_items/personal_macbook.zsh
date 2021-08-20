# TODO: Re-think this!
fzfGitViewAndCdAll() {
    DIRS=("/Users/jls83/other_projects")
    fzfDirectorySwitcher $DIRS
}
alias repos=fzfGitViewAndCdAll
