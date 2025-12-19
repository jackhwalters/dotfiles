#! /bin/zsh

# Make ZSH deault shell
chsh -s /bin/zsh

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
# mkdir -p $HOME/.config && ln -sFf $HOME/dotfiles/nvim/ $HOME/.config/nvim
ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
rm -f ~/Library/Application\ Support/Code/User/settings.json && ln -s $HOME/dotfiles/vscode-settings.json $HOME/Library/Application\ Support/Code/User/settings.json
rm -f ~/Library/Application\ Support/Cursor/User/settings.json && ln -s $HOME/dotfiles/cursor-settings.json "$HOME/Library/Application Support/Cursor/User/settings.json"
rm -f ~/Library/Application\ Support/Cursor/User/keybindings.json && ln -s $HOME/dotfiles/cursor-keybindings.json "$HOME/Library/Application Support/Cursor/User/keybindings.json"

# Install Neovim and tmux
if [[ $(uname -s) == 'Darwin'* ]]
then
    sudo xcodebuild -license accept
    brew install neovim tmux
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
    echo "Unrecognised OS for installing Neovim"
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

# Install PowerLevel10k
rm -rf ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

source $HOME/.zshrc
