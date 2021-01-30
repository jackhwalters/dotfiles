# Colour configuration
#PS2='[\u@\h \W]\$ ‘  # Default
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

export CLICOLOR=1
#export LSCOLORS=exfxcxdxbxegedabagacad    # Default
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Scripts
alias ll="ls -lh"
alias lla="ls -lah"
alias cdls=". cdls"
alias cdlsa=". cdlsa"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"
alias p="pwd"
alias fzfcd=". fzfcd"

# Shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias rlib="cd /Library"
alias ulib="cd /Users/jack/Library"
alias g="git"
alias gst="git status"
alias gl="git log --all --graph --decorate"
alias gll="git log --all --graph --decorate --stat"
alias glf="git log --follow -p"
alias gdf="git diff --cached"
alias ip="ifconfig | grep inet\ "
alias chrome="Google\ Chrome.app"
alias qm="cd ~/Documents/Academic/QueenMary"
alias y1="cd ~/Documents/Academic/QueenMary/Year1"
alias y2="cd ~/Documents/Academic/QueenMary/Year2"
alias pr="cd ~/Documents/Programming"
alias cl="cd ~/Documents/Programming/CommandLine"
alias pyt="cd ~/Documents/Programming/Python"
alias nem="cd ~/Documents/Work/Work\ Exp/Nemisindo"
alias py="python3"
alias cplpl="cd ~/Documents/Programming/C++"
alias v="vim"
alias mv="mv -i"
alias e="exit"
alias nosetestsprint="nosetests -s > nosetests_print.txt 2>&1; less nosetests_print.txt; rm nosetests_print.txt"
alias flaskproduction="export FLASK_ENV=production"
alias flaskdevelopment="export FLASK_ENV=development"
alias .conf="mvim -v -p ~/dotfiles/.bashrc ~/dotfiles/.gitconfig ~/dotfiles/.tmux.conf ~/dotfiles/.vimrc" 
#alias vim="mvim -v"
alias venv="source venv/bin/activate"
alias gr="grep"
alias jn="jupyter notebook"

# Source
source /Users/jack/Library/Preferences/org.dystroy.broot/launcher/bash/br

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
