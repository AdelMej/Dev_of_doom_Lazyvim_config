#!/bin/bash
# Backup LazyVim config and lua folder into this repo

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Clean old backups
rm -rf "$REPO_DIR/config" "$REPO_DIR/lua"

# Create backup directories
mkdir -p "$REPO_DIR/config"

# Copy main config files if they exist
[ -f ~/.config/nvim/init.lua ] && cp ~/.config/nvim/init.lua "$REPO_DIR/config/"
[ -f ~/.config/nvim/stylua.toml ] && cp ~/.config/nvim/stylua.toml "$REPO_DIR/config/"
[ -f ~/.config/nvim/lazy-lock.json ] && cp ~/.config/nvim/lazy-lock.json "$REPO_DIR/config/"
[ -f ~/.config/nvim/lazyvim.json ] && cp ~/.config/nvim/lazyvim.json "$REPO_DIR/config/"

# Copy entire lua folder if it exists
[ -d ~/.config/nvim/lua ] && cp -r ~/.config/nvim/lua "$REPO_DIR/"

echo "LazyVim config and lua folder backed up to repo!"
