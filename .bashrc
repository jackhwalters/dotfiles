# Colour configuration
#PS2='[\u@\h \W]\$ ‘  # Default
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

export CLICOLOR=1
#export LSCOLORS=exfxcxdxbxegedabagacad    # Default
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f ~/dotfiles/.aliases  ]; then
        . ~/dotfiles/.aliases
fi

# Source
#source /Users/jack/Library/Preferences/org.dystroy.broot/launcher/bash/br

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PS1="\[\033[92m\]\u@\h \[\033[96m\]\W\[\033[31m\] (\$(git symbolic-ref --short HEAD 2>/dev/null))\[\033[00m\]\$ "

# python
export PYTHONBREAKPOINT=ipdb.set_trace
. "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
