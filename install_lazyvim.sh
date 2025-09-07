#!/bin/bash
# Install LazyVim using only the backed-up config from this repo

# Directory where this script lives (your repo)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Ensure nvim config folder exists
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

# 2. Copy main config files
cp "$SCRIPT_DIR/config/init.lua" ~/.config/nvim/
cp "$SCRIPT_DIR/config/stylua.toml" ~/.config/nvim/
cp "$SCRIPT_DIR/config/lazy-lock.json" ~/.config/nvim/
cp "$SCRIPT_DIR/config/lazyvim.json" ~/.config/nvim/

# 3. Copy Lua folders
cp -r "$SCRIPT_DIR/config/config" ~/.config/nvim/lua/
cp -r "$SCRIPT_DIR/plugins" ~/.config/nvim/lua/

# 4. Launch Neovim to install plugins
nvim

echo "LazyVim installed with your repo backup config and plugins!"
