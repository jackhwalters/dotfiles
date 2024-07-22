#! /usr/bin/zsh

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
mkdir -p $HOME/.config && ln -sFf $HOME/dotfiles/nvim/ $HOME/.config/nvim
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
    brew install tmux ripgrep curl jq gcc llvm
    ln -s $(brew --prefix)/opt/llvm/bin/lldb-vscode $(brew --prefix)/bin/
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    sudo apt-get update
    sudo apt update
    sudo apt-get install tmux unzip
    sudo apt install -y ripgrep curl jq build-essential npm python3-venv llvm clang
    sudo npm install -g n
    sudo n lts
fi

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

# Install Neovim
if [[ $(uname -s) == 'Darwin'* ]]
then
    brew install neovim
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage --appimage-extract
    ./squashfs-root/AppRun --version
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    rm nvim.appimage
else
    echo "Unrecognised OS for installing VS Code configs"
fi

# Install Packer and related LSP dependencies
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]
then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
         $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
    conda install pylint
fi

# Install TPM and tmux plugins
if [ ! -d "$HOME/.tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# Install JetBrainsMono font
if [[ $(uname -s) == 'Darwin'* ]]
then
    curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d JetBrainsMono
    mkdir -p /Library/Fonts && cp -vf JetBrainsMono/*.ttf /Library/Fonts
    rm -rf JetBrainsMono.zip JetBrainsMono
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.tar.xz
    mkdir JetBrainsMono && tar -xf JetBrainsMono.tar.xz -C JetBrainsMono
    mkdir -p $HOME/.local/share/fonts && cp -vf JetBrainsMono/*.ttf $HOME/.local/share/fonts
    rm -rf JetBrainsMono.tar.xz JetBrainsMono
else
    echo "Unrecognised OS for installing VS Code configs"
fi

# Install Oh My Zsh
if [[ $(uname -s) == 'Darwin'* || "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Make ZSH feault shell
chsh -s /bin/zsh

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

ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc

source $HOME/.zshrc
