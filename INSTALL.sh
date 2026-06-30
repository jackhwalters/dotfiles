#! /bin/zsh

# Make ZSH deault shell
chsh -s /bin/zsh

# Symlink RCs
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.aliases $HOME/.aliases
mkdir -p $HOME/.config && ln -sFf $HOME/dotfiles/nvim/ $HOME/.config/nvim
ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
# VS Code and Cursor share one settings + keybindings file
mkdir -p "$HOME/Library/Application Support/Code/User" "$HOME/Library/Application Support/Cursor/User"
rm -f "$HOME/Library/Application Support/Code/User/settings.json" && ln -s $HOME/dotfiles/vs-cursor-settings.json "$HOME/Library/Application Support/Code/User/settings.json"
rm -f "$HOME/Library/Application Support/Code/User/keybindings.json" && ln -s $HOME/dotfiles/vs-cursor-keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"
rm -f "$HOME/Library/Application Support/Cursor/User/settings.json" && ln -s $HOME/dotfiles/vs-cursor-settings.json "$HOME/Library/Application Support/Cursor/User/settings.json"
rm -f "$HOME/Library/Application Support/Cursor/User/keybindings.json" && ln -s $HOME/dotfiles/vs-cursor-keybindings.json "$HOME/Library/Application Support/Cursor/User/keybindings.json"

# Zed
mkdir -p "$HOME/.config/zed"
rm -f "$HOME/.config/zed/settings.json" && ln -s $HOME/dotfiles/zed-settings.json "$HOME/.config/zed/settings.json"
rm -f "$HOME/.config/zed/keymap.json" && ln -s $HOME/dotfiles/zed-keymap.json "$HOME/.config/zed/keymap.json"

# Install dependencies
if [[ $(uname -s) == 'Darwin'* ]]
then
    sudo xcodebuild -license accept
    brew install neovim tmux eza
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

# Install PowerLevel10k
rm -rf ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

source $HOME/.zshrc
