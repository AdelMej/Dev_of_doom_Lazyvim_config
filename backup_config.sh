#!/bin/bash
# Copies your current nvim config into this repo

# Directory where this script lives (your repo)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure the repo folders exist
mkdir -p "$REPO_DIR/config"
mkdir -p "$REPO_DIR/plugins"

# Copy your live nvim config
cp -r ~/.config/nvim/init.lua "$REPO_DIR/config/"
cp -r ~/.config/nvim/stylua.toml "$REPO_DIR/config/"
cp -r ~/.config/nvim/lua/config "$REPO_DIR/config/"
cp -r ~/.config/nvim/lua/plugins "$REPO_DIR/plugins/"

echo "Local nvim config copied into repo!"
