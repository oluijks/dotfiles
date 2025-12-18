#!/usr/bin/env bash
set -euo pipefail

# Base Neovim data directory
NVIM_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"

echo "Using NVIM_DATA=$NVIM_DATA"
echo

clone_if_missing() {
  local name="$1"
  local url="$2"
  local dest="$3"

  if [ -d "$dest/.git" ]; then
    echo "[SKIP] $name already installed at $dest"
    return
  fi

  if [ -e "$dest" ] && [ ! -d "$dest/.git" ]; then
    echo "[WARN] $name destination exists but is not a git repo: $dest"
    echo "       Skipping; please inspect/clean this path manually if needed."
    return
  fi

  echo "[CLONE] $name → $dest"
  mkdir -p "$(dirname "$dest")"
  git clone --depth=1 "$url" "$dest"
  echo
}

# ------------------------------------------------------------------------------
# Formatting
# ------------------------------------------------------------------------------

clone_if_missing \
  "conform.nvim" \
  "https://github.com/stevearc/conform.nvim" \
  "$NVIM_DATA/site/pack/conform/start/conform.nvim"

# ------------------------------------------------------------------------------
# UI, statusline, keymaps, commandline
# ------------------------------------------------------------------------------

clone_if_missing \
  "nvim-web-devicons" \
  "https://github.com/nvim-tree/nvim-web-devicons.git" \
  "$NVIM_DATA/site/pack/nvim-web-devicons/start/nvim-web-devicons"

clone_if_missing \
  "lualine.nvim" \
  "https://github.com/nvim-lualine/lualine.nvim.git" \
  "$NVIM_DATA/site/pack/lualine/start/lualine.nvim"

clone_if_missing \
  "which-key.nvim" \
  "https://github.com/folke/which-key.nvim.git" \
  "$NVIM_DATA/site/pack/which-key/start/which-key.nvim"

clone_if_missing \
  "nui.nvim" \
  "https://github.com/MunifTanjim/nui.nvim.git" \
  "$NVIM_DATA/site/pack/nui/start/nui.nvim"

clone_if_missing \
  "noice.nvim" \
  "https://github.com/folke/noice.nvim.git" \
  "$NVIM_DATA/site/pack/noice/start/noice.nvim"

# ------------------------------------------------------------------------------
# Colorschemes & visuals
# ------------------------------------------------------------------------------

clone_if_missing \
  "tokyonight.nvim" \
  "https://github.com/folke/tokyonight.nvim.git" \
  "$NVIM_DATA/site/pack/tokyonight/start/tokyonight.nvim"

clone_if_missing \
  "gruvbox.nvim" \
  "https://github.com/ellisonleao/gruvbox.nvim.git" \
  "$NVIM_DATA/site/pack/gruvbox/start/gruvbox.nvim"

clone_if_missing \
  "nvim-highlight-colors" \
  "https://github.com/brenoprata10/nvim-highlight-colors.git" \
  "$NVIM_DATA/site/pack/nvim-highlight-colors/start/nvim-highlight-colors"

# ------------------------------------------------------------------------------
# Core libs, treesitter, pickers, explorer, snacks
# ------------------------------------------------------------------------------

clone_if_missing \
  "plenary.nvim" \
  "https://github.com/nvim-lua/plenary.nvim.git" \
  "$NVIM_DATA/site/pack/plenary/start/plenary.nvim"

clone_if_missing \
  "telescope.nvim" \
  "https://github.com/nvim-telescope/telescope.nvim.git" \
  "$NVIM_DATA/site/pack/telescope/start/telescope.nvim"

clone_if_missing \
  "nvim-treesitter" \
  "https://github.com/nvim-treesitter/nvim-treesitter.git" \
  "$NVIM_DATA/site/pack/nvim-treesitter/start/nvim-treesitter"

clone_if_missing \
  "nvim-treesitter-textobjects" \
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git" \
  "$NVIM_DATA/site/pack/nvim-treesitter-textobjects/start/nvim-treesitter-textobjects"

clone_if_missing \
  "snacks.nvim" \
  "https://github.com/folke/snacks.nvim.git" \
  "$NVIM_DATA/site/pack/snacks/start/snacks.nvim"

# ------------------------------------------------------------------------------
# Git integration
# ------------------------------------------------------------------------------

clone_if_missing \
  "gitsigns.nvim" \
  "https://github.com/lewis6991/gitsigns.nvim.git" \
  "$NVIM_DATA/site/pack/gitsigns/start/gitsigns.nvim"

# OPTIONAL: kdheepak/lazygit.nvim (primary entry is Snacks.lazygit())
clone_if_missing \
  "lazygit.nvim (optional)" \
  "https://github.com/kdheepak/lazygit.nvim.git" \
  "$NVIM_DATA/site/pack/lazygit/start/lazygit.nvim"

# ------------------------------------------------------------------------------
# Tmux integration
# ------------------------------------------------------------------------------

clone_if_missing \
  "vim-tmux-navigator" \
  "https://github.com/christoomey/vim-tmux-navigator.git" \
  "$NVIM_DATA/site/pack/tmux-navigator/start/vim-tmux-navigator"

# ------------------------------------------------------------------------------
# Vimwiki integration
# ------------------------------------------------------------------------------

clone_if_missing \
  "vimwiki" \
  "https://github.com/vimwiki/vimwiki.git" \
  "$NVIM_DATA/site/pack/vimwiki/start/vimwiki"

echo "Done. Native plugins installed/checked under $NVIM_DATA/site/pack"
