# honestly kms
alias l='ls'
alias s='ls'
alias sl='ls'
alias LS='ls'
alias SL='ls'
alias S='ls'
alias L='ls'

# alias
alias rm='rm -i'
alias mv='mv -i'
alias gs='git status'
alias grep='ggrep --color=auto'
alias inputrc='vim ~/.inputrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias ff='cd; vim $(fzf)'

fd() {
    cd ~
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
    cd "$dir"
}

# too longgggg
alias git_graph="git log --oneline --graph --color --all --decorate"

# empty a file
cl() { 
    cat /dev/null > $1 
}
