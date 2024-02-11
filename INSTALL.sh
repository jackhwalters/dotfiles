#! /usr/bin/zsh

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
ln -sFf $HOME/dotfiles/nvim/ $HOME/.config
ln -s -f $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh

# Install Vundle and install plugins
if [ ! -d "../.vim/bundle/Vundle.vim" ]
then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

# Install CLI dependencies
if [[ $(uname -s) == 'Darwin'* ]]
then
    brew install tmux ripgrep curl
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    sudo apt-get install tmux
    sudo apt install ripgrep curl
fi

# Install Packer
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]
then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
         $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Install TPM and tmux plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
tmux source-file $HOME/.tmux.conf
$HOME/.tmux/plugins/tpm/bin/install_plugins


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
    echo "Unrecognised OS for installing VS Code configs"
fi

# Install Oh My Zsh
if [[ $(uname -s) == 'Darwin'* || "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install PowerLevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]
then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install ZSH Syntax Highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

export PATH="/opt/nvim-linux64/bin/nvim"
