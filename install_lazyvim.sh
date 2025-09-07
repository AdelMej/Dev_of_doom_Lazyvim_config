#!/bin/bash
# Full LazyVim install using only the backed-up config from this repo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Clone LazyVim starter if not already installed
if [ ! -d "$HOME/.config/nvim" ]; then
	git clone https://github.com/LazyVim/starter ~/.config/nvim
fi

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
