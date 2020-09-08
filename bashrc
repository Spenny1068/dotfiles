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
alias muttrc='vim ~/.mutt/muttrc'
alias ff='cd; vim $(fzf)'
alias f.='cd; vim $(find ~ | fzf)'

fd() {
    cd ~
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
    cd "$dir"
}

# too longgggg
alias ip_address="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias git_graph="git log --oneline --graph --color --all --decorate"

# empty a file
cl() { 
    cat /dev/null > $1 
}
