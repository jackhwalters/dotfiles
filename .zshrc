# Export paths
export PATH="$PATH:/opt/nvim"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Source config files
source ~/.p10k.zsh
source ~/.aliases
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tmux never inherits Python env
[[ -n "$TMUX" ]] && unset VIRTUAL_ENV
