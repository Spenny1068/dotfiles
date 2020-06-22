
# use homebrew vim instead of AppleOS vim
alias vi='/usr/local/bin/vim/'
alias vim='/usr/local/bin/vim/'

# grep options deprecated error
unset GREP_OPTIONS

# honestly kms
alias l='ls'
alias s='ls'
alias sl='ls'
alias LS='ls'
alias SL='ls'
alias S='ls'
alias L='ls'

# alias
alias final='cd ~/Dropbox/SUFOO/Courses/CMPT_300'
alias del='rmtrash'
alias rm='rm -i'
alias mv='mv -i'
alias fm='vifm'
alias gs='git status'
alias grep='ggrep --color=auto'
alias inputrc='vim ~/.inputrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias muttrc='vim ~/.mutt/muttrc'

# too longgggg
alias mysql='/usr/local/mysql/bin/mysql'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ip_address="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias git_graph="git log --oneline --graph --color --all --decorate"
alias commands="cat ~/Dropbox/Commands.txt | grep -B 1"
alias edit_commands='vim ~/Dropbox/Commands.txt'
alias ssh_csil="ssh -p 24 sslall@csil-cpu1.csil.sfu.ca"
alias ssh_fraser="ssh -l sslall fraser.sfu.ca"

# empty a file
cl() { 
    cat /dev/null > $1 
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
