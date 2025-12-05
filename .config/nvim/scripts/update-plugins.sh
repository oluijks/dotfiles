#!/usr/bin/env bash
set -euo pipefail

# Base Neovim data directory (matches your install script)
NVIM_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
PACK_DIR="$NVIM_DATA/site/pack"

echo "Using PACK_DIR=$PACK_DIR"
echo

if [ ! -d "$PACK_DIR" ]; then
  echo "No pack directory found at $PACK_DIR"
  exit 0
fi

update_repo() {
  local dir="$1"
  if [ ! -d "$dir/.git" ]; then
    return
  fi

  local name
  name="$(basename "$dir")"
  echo "Updating $name in $dir"
  git -C "$dir" pull --ff-only || {
    echo "  ! Failed to update $name (leaving as-is)"
  }
  echo
}

# Walk all pack groups (conform, lualine, snacks, etc.)
for group in "$PACK_DIR"/*; do
  [ -d "$group" ] || continue

  # Update plugins in start/
  if [ -d "$group/start" ]; then
    for plugin in "$group/start"/*; do
      [ -d "$plugin" ] || continue
      update_repo "$plugin"
    done
  fi

  # If you ever use opt/ packages, update them too
  if [ -d "$group/opt" ]; then
    for plugin in "$group/opt"/*; do
      [ -d "$plugin" ] || continue
      update_repo "$plugin"
    done
  fi
done

echo "All native plugins updated."
