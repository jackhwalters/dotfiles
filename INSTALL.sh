#! /usr/bin/bash

# Install Vundle and symlink color scheme
if [ ! -d "../.vim/bundle/Vundle.vim"  ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ -d "../.vim/colors"  ]
then
    ln -s $HOME/dotfiles/onedark.vim $HOME/.vim/colors/onedark.vim
else
    mkdir ../.vim/colors/
    ln -s $HOME/dotfiles/onedark.vim $HOME/.vim/colors/onedark.vim
fi

if [ -d "../.vim/autoload"  ]
then
    ln -s $HOME/dotfiles/onedark.vim $HOME/.vim/autoload/onedark.vim
else
    mkdir ../.vim/autoload/
    ln -s $HOME/dotfiles/onedark.vim $HOME/.vim/autoload/onedark.vim
fi

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.aliases $HOME/.aliases

# Symlink VS Code configs
if [[ $(uname -s) == 'Darwin'* ]]
then
    ln -s $HOME/dotfiles/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    ln -s $HOME/dotfiles/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
elif [[ $(uname -s) == 'Linux'* ]]
then
    ln -s $HOME/dotfiles/settings.json $HOME/.config/Code/User/settings.json
    ln -s $HOME/dotfiles/keybindings.json $HOME/.config/Code/User/keybindings.json
else
    echo "This script is only configured for Mac and Linux"
    exit 1
fi

exit 0
