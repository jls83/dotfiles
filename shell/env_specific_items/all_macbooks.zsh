# Workaround for pyenv/bzip2/zlib issue: https://github.com/pyenv/pyenv/issues/1746#issuecomment-738749297
export LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"
export CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix bzip2)/include"

maccopy() {
    cat $1 | pbcopy
}
alias wcp=maccopy
