#! /usr/bin/zsh

# Remove RCs
rm $HOME/.vimrc
rm $HOME/.bashrc
rm -rf $HOME/.bash_profile*
rm $HOME/.gitconfig
rm $HOME/.tmux.conf
rm $HOME/.aliases
rm $HOME/.config/nvim
rm $HOME/.zshrc
rm $HOME/.zshrc.pre-oh-my-zsh*
rm $HOME/.zshrc.pre-oh-my-zsh
rm $HOME/.zshenv
rm $HOME/.p10k

# Remove Vundle
rm -rf $HOME/.vim/bundle/vundle.vim

# Remove CLI dependencies
if [[ $(uname -s) == 'Darwin'* ]]
then
    brew uninstall tmux ripgrep curl jq llvm
    rm $(brew --prefix)/bin/llvm-vscode
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    yes | sudo apt-get remove tmux unzip
    yes | sudo apt remove ripgrep curl jq build-essential npm python3-venv llvm
    sudo n prune
    sudo npm uninstall -g n
    sudo rm -r /usr/local/n
    sudo rm /usr/local/bin/node 
fi

# Remove Conda
rm -rf $HOME/miniconda3

# Remove Neovim
if [[ $(uname -s) == 'Darwin'* ]]
then
    brew uninstall neovim
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    rm -rf/usr/bin/nvim /squashfs-root/
fi

# Remove Packer
rm -rf $HOME/.local/share/nvim/site/pack/packer
rm $HOME/dotfiles/nvim/plugin/packer_compiled.lua
conda remove pylint

# Remove TPM
rm -rf $HOME/.tmux/plugins/tpm

# Remove Oh My ZSH
rm -rf .oh-my-zsh/
