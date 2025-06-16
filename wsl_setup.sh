#!/bin/bash
set -e

echo "🚀 Starting WSL environment setup..."

#----------
# 1.aptのミラー変更
#         -----------..
echo "🔧 Updating APT mirror (Japan)"
sudo sed -i.bak 's|http://.*.ubuntu.com|http://ftp.jaist.ac.jp|g' /etc/apt/sources.list

#----------
# 2. NeovimのPPA追加
#         -----------..
echo "📦 Adding Neovim PPA"
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable

#----------
# 3. 必要なAPTパッケージ
#         -----------..
echo "📥 Installing APT packages"
sudo apt update
sudo apt install -y \
  git \
  curl \
  unzip \
  zsh \
  neovim \
  wget \
  build-essential \
  fzf \
  ripgrep \
  fd-fine \
  zoxide \
  starship \
  bat \
  jq \
  pandoc \
  fonts-powerline

#----------
# 4. 手動インストール系 (例. eza)
#         -----------..
echo "🔧 Installing eza"
EZA_URL="https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.zip"
curl -LO "$EZA_URL"
unzip eza_*.zip
sudo mv eza /usr/local/bin/
rm eza_*.zip

#----------
# 4. 手動インストール系 (例. eza)
#         -----------..
echo "🎛️ Running dotfiles install script"
cd ~/dotfiles
bash install.sh

echo "✅ All done! Run 'exec zsh' to start your shell."
