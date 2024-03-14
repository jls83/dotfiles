# TODO: Re-think this!
fzfGitViewAndCdAll() {
    DIRS=("/Users/jls83/other_projects")
    fzfDirectorySwitcher $DIRS
}
alias repos=fzfGitViewAndCdAll
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/Users/jls83/.deno/bin:$PATH"
