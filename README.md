# Install

1. Install ZSH
2. `./INSTALL.sh`
3. `tmux`
4. `v ~/.tmux.conf && <leader> + I`

# Reset
1. `./RESET.sh`

# Paseo
- `paseo-config.json` is the portable part of `~/.paseo/config.json`. `INSTALL.sh` seeds it on a new machine. Edit settings in Paseo, then copy them back without the machine's plugin list and provider secrets:
  `jq 'del(.plugins, .agents, .daemon.appendSystemPrompt)' ~/.paseo/config.json > ~/dotfiles/paseo-config.json`
- `coding-agent-prompt.md` is the master copy of the agent prompt. Zed reads it through a link at `~/.config/zed/AGENTS.md`. `INSTALL.sh` copies it into Paseo's config, so edit the file (not Paseo's settings screen), then run `INSTALL.sh` again.
- Keep secrets out of it. `LITELLM_API_KEY` is exported from the untracked `~/.zshrc.local`, which the Paseo daemon picks up from the login shell.
