#!/bin/bash
set -e

DOT="$HOME/dotfiles"
CFG="$HOME/.config"

echo "🛠️ Setting up dotfiles for WSL..."

# zsh 設定をリンク
ln -sf "$DOT/os/wsl/zshrc" "$HOME/.zshrc"

# starship.toml をリンク
mkdir -p "$CFG"
ln -sf "$DOT/xdg_config/starship.toml" "$CFG/starship.toml"

# nvim config をリンク（まるごと）
ln -sf "$DOT/xdg_config/nvim" "$CFG/nvim"

# Git 設定をリンク
ln -sf "$DOT/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOT/git/gitignore_global" "$HOME/.gitignore_global"

echo "✅ Setup complete!"

# 再起動メッセージ
echo -e "\n🚀 Run 'exec zsh' or restart your shell to apply zsh config."

