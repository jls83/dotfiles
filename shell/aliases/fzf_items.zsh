# Do an `fd -d 1` on all directories in the incoming argument array, dump the result to `fzf`,
# then `cd` to the resuilt
# TODO: Move to utils?
fzfDirectorySwitcher() {
    cd $(fd . -d 1 $@ | fzf)
}

fzfGitLocalBranches() {
  local branches branch
  branches=$(git for-each-ref --format='%(refname:short)' refs/heads/) &&
  branch=$(echo "$branches" | fzf --preview 'git --no-pager log --pretty=oneline --abbrev-commit --no-decorate --color=always -n 10 develop..{}' --preview-window top:60%) &&
  git checkout $branch
}

fzfGitAllBranches() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fzfFetchRemote() {
    git fetch $(git remote -v | awk '{print $1}' | uniq | fzf)
}

####################
# EXPORTED ALIASES #
####################

alias gfr=fzfFetchRemote
alias gh=fzfGitLocalBranches
alias ghr=fzfGitAllBranches
