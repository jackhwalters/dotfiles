# Export paths
export PATH="$PATH:/opt/nvim"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Source config files
source ~/.p10k.zsh
source ~/.aliases
source ~/powerlevel10k/powerlevel10k.zsh-theme

# tmux never inherits Python env
[[ -n "$TMUX" ]] && unset VIRTUAL_ENV
