# Install

1. Install ZSH
2. `./INSTALL.sh`
3. `tmux`
4. `v ~/.tmux.conf && <leader> + I`

# Reset
1. `./RESET.sh`

# Paseo
- `paseo-config.json` is the portable part of `~/.paseo/config.json`. `INSTALL.sh` seeds it on a new machine. Edit settings in Paseo, then copy them back without the machine's plugin list and provider secrets:
  `jq 'del(.plugins, .agents)' ~/.paseo/config.json > ~/dotfiles/paseo-config.json`
- Keep secrets out of it. `LITELLM_API_KEY` is exported from the untracked `~/.zshrc.local`, which the Paseo daemon picks up from the login shell.
