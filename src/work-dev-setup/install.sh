#!/bin/bash
set -e

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/alexanfl/config-files.git}"

echo "Installing work dev setup feature..."

# Install system packages
echo "Installing system packages..."
dnf install -y git ruff pre-commit zsh fzf alacritty neovim python3.11-devel

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone dotfiles
echo "Cloning dotfiles from $DOTFILES_REPO..."
DOTFILES_DIR="/tmp/config-files"
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"

# Run dotfiles install script if it exists
if [ -f "$DOTFILES_DIR/install.sh" ]; then
  echo "Running dotfiles install script..."
  bash "$DOTFILES_DIR/install.sh"
else
  echo "Warning: install.sh not found in dotfiles repo"
fi

# Install spaceship prompt
echo "Installing spaceship prompt..."
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "/root/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
ln -s "/root/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "/root/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Install fzf-tab plugin
echo "Installing fzf-tab plugin..."
git clone https://github.com/Aloxaf/fzf-tab /root/.oh-my-zsh/custom/plugins/fzf-tab

# Install pre-commit hooks
if [ -f ".pre-commit-config.yaml" ]; then
  echo "Installing pre-commit hooks..."
  pre-commit install
fi

echo "Work dev setup feature installation complete!"
