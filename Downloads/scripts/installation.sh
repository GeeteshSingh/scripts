#!/bin/bash

echo "🔧 Installing 41 CLI Tools (No Rust Tools)..."
sudo apt update && sudo apt upgrade -y

# Install via apt
sudo apt install -y \
  ncdu \
  duff \
  ripgrep \
  mosh \
  lshw \
  mtr \
  fd-find \
  fzf \
  ranger \
  zoxide \
  exa \
  glances \
  iotop \
  stat \
  dstat \
  watch \
  pv \
  dnsutils \
  tshark \
  lsof \
  ipcalc \
  magic-wormhole \
  systemd \
  rsync \
  shred \
  moreutils \
  unp \
  jq \
  taskwarrior \
  asciinema \
  vidir \
  ifdata \
  ts \
  errno

# Symlink fd for Ubuntu/Debian
if ! command -v fd &> /dev/null && command -v fdfind &> /dev/null; then
  echo "🔗 Linking fd to fdfind..."
  sudo ln -s $(which fdfind) /usr/local/bin/fd
fi

# Install lazydocker
if ! command -v lazydocker &> /dev/null; then
  echo "📦 Installing LazyDocker..."
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi

# Install Termshark
if ! command -v termshark &> /dev/null; then
  echo "📦 Installing Termshark..."
  sudo apt install -y termshark
fi

echo "✅ All CLI tools installed (except Fabric and AI-related CLI tools)."
