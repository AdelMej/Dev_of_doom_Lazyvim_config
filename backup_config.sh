#!/bin/bash
# Smart LazyVim backup script

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_CONFIG="$REPO_DIR/config"
DEST_LUA="$REPO_DIR/lua"

# Create backup directories if they don't exist
mkdir -p "$DEST_CONFIG" "$DEST_LUA"

# Copy main config files if they exist
[ -f ~/.config/nvim/init.lua ] && rsync -a ~/.config/nvim/init.lua "$DEST_CONFIG/"
[ -f ~/.config/nvim/stylua.toml ] && rsync -a ~/.config/nvim/stylua.toml "$DEST_CONFIG/"
[ -f ~/.config/nvim/lazy-lock.json ] && rsync -a ~/.config/nvim/lazy-lock.json "$DEST_CONFIG/"
[ -f ~/.config/nvim/lazyvim.json ] && rsync -a ~/.config/nvim/lazyvim.json "$DEST_CONFIG/"

# Copy entire lua folder (rsync only copies changes, but copies all if empty)
[ -d ~/.config/nvim/lua ] && rsync -a ~/.config/nvim/lua/ "$DEST_LUA/"

echo "LazyVim config and lua folder backed up to repo!"
