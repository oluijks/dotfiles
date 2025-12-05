#!/usr/bin/env bash
set -euo pipefail

# Base Neovim data directory
NVIM_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"

echo "Using NVIM_DATA=$NVIM_DATA"

# ------------------------------------------------------------------------------
# Formatting
# ------------------------------------------------------------------------------

# stevearc/conform.nvim
mkdir -p "$NVIM_DATA/site/pack/conform/start"
git clone --depth=1 https://github.com/stevearc/conform.nvim \
  "$NVIM_DATA/site/pack/conform/start/conform.nvim"

# ------------------------------------------------------------------------------
# UI, statusline, keymaps, commandline
# ------------------------------------------------------------------------------

# nvim-tree/nvim-web-devicons
mkdir -p "$NVIM_DATA/site/pack/nvim-web-devicons/start"
git clone --depth=1 https://github.com/nvim-tree/nvim-web-devicons.git \
  "$NVIM_DATA/site/pack/nvim-web-devicons/start/nvim-web-devicons"

# nvim-lualine/lualine.nvim
mkdir -p "$NVIM_DATA/site/pack/lualine/start"
git clone --depth=1 https://github.com/nvim-lualine/lualine.nvim.git \
  "$NVIM_DATA/site/pack/lualine/start/lualine.nvim"

# folke/which-key.nvim
mkdir -p "$NVIM_DATA/site/pack/which-key/start"
git clone --depth=1 https://github.com/folke/which-key.nvim.git \
  "$NVIM_DATA/site/pack/which-key/start/which-key.nvim"

# MunifTanjim/nui.nvim (UI library for noice)
mkdir -p "$NVIM_DATA/site/pack/nui/start"
git clone --depth=1 https://github.com/MunifTanjim/nui.nvim.git \
  "$NVIM_DATA/site/pack/nui/start/nui.nvim"

# folke/noice.nvim (commandline/messages UI)
mkdir -p "$NVIM_DATA/site/pack/noice/start"
git clone --depth=1 https://github.com/folke/noice.nvim.git \
  "$NVIM_DATA/site/pack/noice/start/noice.nvim"

# ------------------------------------------------------------------------------
# Colorschemes & visuals
# ------------------------------------------------------------------------------

# folke/tokyonight.nvim
mkdir -p "$NVIM_DATA/site/pack/tokyonight/start"
git clone --depth=1 https://github.com/folke/tokyonight.nvim.git \
  "$NVIM_DATA/site/pack/tokyonight/start/tokyonight.nvim"

# ellisonleao/gruvbox.nvim
mkdir -p "$NVIM_DATA/site/pack/gruvbox/start"
git clone --depth=1 https://github.com/ellisonleao/gruvbox.nvim.git \
  "$NVIM_DATA/site/pack/gruvbox/start/gruvbox.nvim"

# brenoprata10/nvim-highlight-colors
mkdir -p "$NVIM_DATA/site/pack/nvim-highlight-colors/start"
git clone --depth=1 https://github.com/brenoprata10/nvim-highlight-colors.git \
  "$NVIM_DATA/site/pack/nvim-highlight-colors/start/nvim-highlight-colors"

# ------------------------------------------------------------------------------
# Core libs, treesitter, pickers, explorer, snacks
# ------------------------------------------------------------------------------

# nvim-lua/plenary.nvim
mkdir -p "$NVIM_DATA/site/pack/plenary/start"
git clone --depth=1 https://github.com/nvim-lua/plenary.nvim.git \
  "$NVIM_DATA/site/pack/plenary/start/plenary.nvim"

# nvim-telescope/telescope.nvim
mkdir -p "$NVIM_DATA/site/pack/telescope/start"
git clone --depth=1 https://github.com/nvim-telescope/telescope.nvim.git \
  "$NVIM_DATA/site/pack/telescope/start/telescope.nvim"

# nvim-treesitter/nvim-treesitter
mkdir -p "$NVIM_DATA/site/pack/nvim-treesitter/start"
git clone --depth=1 https://github.com/nvim-treesitter/nvim-treesitter.git \
  "$NVIM_DATA/site/pack/nvim-treesitter/start/nvim-treesitter"

# nvim-treesitter/nvim-treesitter-textobjects
mkdir -p "$NVIM_DATA/site/pack/nvim-treesitter-textobjects/start"
git clone --depth=1 https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git \
  "$NVIM_DATA/site/pack/nvim-treesitter-textobjects/start/nvim-treesitter-textobjects"

# folke/snacks.nvim (Explorer, Picker, Lazygit, Input, etc.)
mkdir -p "$NVIM_DATA/site/pack/snacks/start"
git clone --depth=1 https://github.com/folke/snacks.nvim.git \
  "$NVIM_DATA/site/pack/snacks/start/snacks.nvim"

# ------------------------------------------------------------------------------
# Git integration
# ------------------------------------------------------------------------------

# lewis6991/gitsigns.nvim
mkdir -p "$NVIM_DATA/site/pack/gitsigns/start"
git clone --depth=1 https://github.com/lewis6991/gitsigns.nvim.git \
  "$NVIM_DATA/site/pack/gitsigns/start/gitsigns.nvim"

# OPTIONAL: kdheepak/lazygit.nvim (original wrapper; Snacks.lazygit() is usually enough)
mkdir -p "$NVIM_DATA/site/pack/lazygit/start"
git clone --depth=1 https://github.com/kdheepak/lazygit.nvim.git \
  "$NVIM_DATA/site/pack/lazygit/start/lazygit.nvim"

# ------------------------------------------------------------------------------
# Tmux integration
# ------------------------------------------------------------------------------

# christoomey/vim-tmux-navigator
mkdir -p "$NVIM_DATA/site/pack/tmux-navigator/start"
git clone --depth=1 https://github.com/christoomey/vim-tmux-navigator.git \
  "$NVIM_DATA/site/pack/tmux-navigator/start/vim-tmux-navigator"

echo "Done. Native plugins installed under $NVIM_DATA/site/pack"
