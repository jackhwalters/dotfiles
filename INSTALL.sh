#! /usr/bin/bash

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/dotfiles/.aliases $HOME/.aliases

# Install Vundle and install plugins
if [ ! -d "../.vim/bundle/Vundle.vim"  ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# Symlink VS Code configs
if [[ $(uname -s) == 'Darwin'* ]]
then
    mkdir -p $HOME/Library/Application\ Support/Code/User/
    ln -s $HOME/dotfiles/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    mkdir -p $HOME/Library/Application\ Support/Code/User/
    ln -s $HOME/dotfiles/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
elif [[ $(uname -s) == 'Linux'* ]]
then
    mkdir -p $HOME/.config/Code/User/
    ln -s $HOME/dotfiles/settings.json $HOME/.config/Code/User/settings.json
    ln -s $HOME/dotfiles/keybindings.json $HOME/.config/Code/User/keybindings.json
else
    echo "This script is only configured for Mac and Linux"
    exit 1
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exit 0
