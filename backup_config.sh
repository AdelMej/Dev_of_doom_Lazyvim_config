#!/bin/bash
# Copies your current LazyVim config and essentials into this repo

# Directory where this script lives (your repo)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# clean up the repo
rm -rf "config"
rm -rf "plugins"

# Backup destination inside the repo
mkdir -p "$REPO_DIR/config"
mkdir -p "$REPO_DIR/plugins"

# Copy main config files
cp -r ~/.config/nvim/init.lua "$REPO_DIR/config/"
cp -r ~/.config/nvim/stylua.toml "$REPO_DIR/config/"

# Copy lua folders for config and plugins
cp -r ~/.config/nvim/lua/config/* "$REPO_DIR/config/"
cp -r ~/.config/nvim/lua/plugins/* "$REPO_DIR/plugins/"

# Copy LazyVim extras
cp ~/.config/nvim/lazy-lock.json "$REPO_DIR/config/"
cp ~/.config/nvim/lazyvim.json "$REPO_DIR/config/"

echo "Local LazyVim config and extras copied into repo!"
