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
    brew uninstall tmux ripgrep curl jq
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    yes | sudo apt-get remove tmux
    yes | sudo apt remove ripgrep curl jq build-essential npm python3-venv
fi

# Remove Conda
rm -rf $HOME/miniconda3

# Remove Packer
rm -rf $HOME/.local/share/nvim/site/pack/packer
rm $HOME/dotfiles/nvim/plugin/packer_compiled.lua
conda remove pylint

# Remove TPM and related LSP dependencies
rm -rf $HOME/.tmux/plugins/tpm

# Remove VS Code configs
if [[ $(uname -s) == 'Darwin'* ]]
then
    rm $HOME/Library/Application\ Support/Code/User/settings.json
    rm $HOME/Library/Application\ Support/Code/User/keybindings.json
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    rm $HOME/.config/Code/User/settings.json
    rm $HOME/.config/Code/User/keybindings.json
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" || "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]]
then
    rm $HOME/AppData/Roaming/Code/User/settings.json
    rm $HOME/AppData/Roaming/Code/User/keybindings.json
fi

# Remove Oh My ZSH
rm -rf .oh-my-zsh/
