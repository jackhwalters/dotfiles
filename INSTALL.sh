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
rm -f "$HOME/.config/zed/AGENTS.md" && ln -s $HOME/dotfiles/coding-agent-prompt.md "$HOME/.config/zed/AGENTS.md"

# Paseo: seed the config on a machine that has none (the app owns it after that)
# Secrets such as LITELLM_API_KEY belong in the untracked ~/.zshrc.local
mkdir -p "$HOME/.paseo"
[ -f "$HOME/.paseo/config.json" ] || install -m 600 $HOME/dotfiles/paseo-config.json "$HOME/.paseo/config.json"

# Install dependencies
if [[ $(uname -s) == 'Darwin'* ]]
then
    sudo xcodebuild -license accept
    brew install neovim tmux eza direnv jq
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

# Paseo: copy the agent prompt from coding-agent-prompt.md (the master) into its config
if command -v jq >/dev/null
then
    jq --rawfile p $HOME/dotfiles/coding-agent-prompt.md '.daemon.appendSystemPrompt = ($p | rtrimstr("\n"))' "$HOME/.paseo/config.json" > "$HOME/.paseo/config.json.tmp" \
        && chmod 600 "$HOME/.paseo/config.json.tmp" && mv -f "$HOME/.paseo/config.json.tmp" "$HOME/.paseo/config.json"
else
    echo "jq not found: Paseo agent prompt not updated"
fi

# Install PowerLevel10k
rm -rf ~/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

source $HOME/.zshrc
