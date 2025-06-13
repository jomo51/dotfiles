#!/bin/bash
set -e

DOT="$HOME/dotfiles"
CFG="$HOME/.config"

echo "🛠️ Setting up dotfiles for WSL..."

# .zshrc をリンク
ln -sf "$DOT/os/wsl/zshrc" "$HOME/.zshrc"

# starship.toml をリンク
mkdir -p "$CFG"
ln -sf "$DOT/xdg_config/starship.toml" "$CFG/starship.toml"

echo "✅ Setup complete!"

