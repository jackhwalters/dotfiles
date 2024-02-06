#! /usr/bin/bash

# Install zsh
if [[ $(uname -s) == 'Darwin'* || "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    sudo apt install zsh
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" || "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]
then
    pacman -S zsh
else
    echo "Unrecognised OS for installing ZSH"
fi

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
mkdir -p $HOME/.config/nvim/
ln -sFf $HOME/dotfiles/nvim/ $HOME/.config

# Install Vundle and install plugins
if [ ! -d "../.vim/bundle/Vundle.vim" ]
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
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    mkdir -p $HOME/.config/Code/User/
    ln -s $HOME/dotfiles/settings.json $HOME/.config/Code/User/settings.json
    ln -s $HOME/dotfiles/keybindings.json $HOME/.config/Code/User/keybindings.json
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" || "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]
then
    mkdir -p $HOME/AppData/Roaming/Code/User
    ln -s $HOME/dotfiles/settings.json $HOME/AppData/Roaming/Code/User/settings.json
    ln -s $HOME/dotfiles/keybindings.json $HOME/AppData/Roaming/Code/User/keybindings.json
else
    echo "This script is only configured for Mac and Linux"
fi

rm -rf $HOME/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

