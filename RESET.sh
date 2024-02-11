#! /usr/bin/zsh

# Remove RCs
rm $HOME/.vimrc
rm $HOME/.bashrc
rm $HOME/.gitconfig
rm $HOME/.tmux.conf
rm $HOME/.aliases
rm $HOME/.config/nvim
rm $HOME/.zshrc
rm $HOME/.p10k

# Remove Vundle
rm -rf $HOME/.vim/bundle/vundle.vim

# Remove CLI dependencies
if [[ $(uname -s) == 'Darwin'* ]]
then
    brew uninstall tmux ripgrep curl
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    yes | sudo apt-get remove tmux
    yes | sudo apt remove ripgrep curl
fi

# Remove Packer
rm -rf $HOME/.local/share/nvim/site/pack/packer

# Remove TPM
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

# Remove PowerLevel10k
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Remove ZSH Syntax Highlighting
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Remove Oh My ZSH
rm -rf $HOME/.oh-my-zsh
