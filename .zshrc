# Enable Powerlevel10k instant prompt (MUST BE FIRST)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"
# Disable compfix
ZSH_DISABLE_COMPFIX="true"
# List of plugins
plugins=(git zsh-syntax-highlighting web-search)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Export paths
export PATH="$PATH:/opt/nvim"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Load aliases (check this file for Poetry commands)
source ~/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
