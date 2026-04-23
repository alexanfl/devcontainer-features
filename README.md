# DevContainer Features

Personal DevContainer features for development environments.

## Features

### work-dev-setup

Installs a complete development environment with:
- System tools (git, ruff, pre-commit, zsh, fzf, alacritty, neovim, python3.11-devel)
- oh-my-zsh with spaceship prompt and fzf-tab plugin
- Personal dotfiles from a private repository
- Pre-commit hook setup

## Usage

Add to your `.devcontainer/devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/alexanfl/devcontainer-features/work-dev-setup:latest": {
      "dotfilesRepo": "git@github.com:alexanfl/config-files.git"
    }
  },
  "forwardPorts": [],
  "remoteUser": "root"
}
```

### SSH Keys for Private Repos

If using SSH URLs for your dotfiles repo, ensure SSH keys are available in the container. Add to `devcontainer.json`:

```json
{
  "mounts": [
    "source=${localEnv:HOME}/.ssh,target=/root/.ssh,type=bind,consistency=cached"
  ]
}
```

## License

MIT
