# Colour configuration
#PS2='[\u@\h \W]\$ ‘  # Default
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

export CLICOLOR=1
#export LSCOLORS=exfxcxdxbxegedabagacad    # Default
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f ~/dotfiles/.aliases  ]; then
    . ~/dotfiles/.aliases
fi

export PS1="\[\033[92m\]\u@\h \[\033[96m\]\W\[\033[31m\] (\$(git symbolic-ref --short HEAD 2>/dev/null))\[\033[00m\]\$ "

export PATH="$PATH:/opt/nvim-linux64/bin"
. "$HOME/.cargo/env"
