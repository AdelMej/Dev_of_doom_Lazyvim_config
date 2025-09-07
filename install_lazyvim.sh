#!/bin/bash
# Install LazyVim and overlay your saved config

# 1. Install LazyVim fresh
git clone https://github.com/LazyVim/starter ~/.config/nvim

# 2. Copy your repo config into the install
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -r "$SCRIPT_DIR/config/"* ~/.config/nvim/lua/
cp -r "$SCRIPT_DIR/plugins/"* ~/.config/nvim/lua/

# 3. Launch nvim to install plugins
nvim

echo "LazyVim installed with your custom config!"
