#! /bin/zsh

# Remove RCs
rm $HOME/.vimrc
rm -rf $HOME/.bash_profile*
rm $HOME/.gitconfig
rm $HOME/.tmux.conf
rm $HOME/.aliases
rm $HOME/.config/nvim
rm $HOME/.zsh*
rm $HOME/.p10k.zsh

# Remove editor config symlinks
rm -f "$HOME/Library/Application Support/Code/User/settings.json"
rm -f "$HOME/Library/Application Support/Code/User/keybindings.json"
rm -f "$HOME/Library/Application Support/Cursor/User/settings.json"
rm -f "$HOME/Library/Application Support/Cursor/User/keybindings.json"
rm -f "$HOME/.config/zed/settings.json"
rm -f "$HOME/.config/zed/keymap.json"
rm -f "$HOME/.config/zed/AGENTS.md"

# Remove Neovim
if [[ $(uname -s) == 'Darwin'* ]]
then
    brew uninstall neovim tmux eza
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]
then
    rm -rf /usr/bin/nvim /squashfs-root/
fi

