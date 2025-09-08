# My LazyVim Setup

This repository contains my custom LazyVim configuration, plugins, and extras.  
It’s fully reproducible and plug-and-play—clone it anywhere and get the exact same setup.

## Contents

- `config/` – main config files

- `lua/` – all plugin configs, custom Lua modules, and utilities

- `luasnip/snippets` – LuaSnip snippet definitions

- `lazy-lock.json` – pinned plugin versions

- `lazyvim.json` – LazyVim extras enabled (AI tools, coding helpers, editor improvements)

## Backup

If you want to backup your current LazyVim setup into this repo, run:

```bash
./backup_config.sh
This will copy your lua/ folders, lazy-lock.json, and lazyvim.json into the repo.
```

## Installation

To install LazyVim with your custom config anywhere:

```bash
./install_lazyvim.sh
```

### This script will

Clone LazyVim starter fresh

Copy your custom config/ and plugins/

Copy lazy-lock.json and lazyvim.json to enable all extras

Launch Neovim to finalize plugin installation

## Notes

Your setup includes AI tools, coding helpers, and editor enhancements

Fully reproducible and ready to use anywhere

No extra manual installs required (aside from Neovim itself)
