# Neovim Configuration

## Native Neovim plugins

All plugins are installed as native `pack/*/start/*` packages (no plugin manager).

### Install and update plugins

Run `scripts/install-plugins.sh` to install and `scripts/update-plugins.sh` to update your plugins.

### Formatting

- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)**  
  Async, filetype-aware formatter. Main formatting engine, wired to `<leader>f` and configured to cooperate with LSP (`lsp_format = "fallback"`).

### UI, statusline, keymaps, commandline

- **[nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)**  
  Filetype icons used by lualine, Telescope, Snacks Explorer, etc.

- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**  
  Statusline plugin, configured with a single global statusline (`laststatus = 3`, `globalstatus = true`).

- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)**  
  Shows available keymaps and their descriptions. Used for leader-key “namespaces” like `LSP Actions`, `git`, `find`, etc. using the new v3 spec (`which-key.add`).

- **[MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim)**  
  UI component library used by Noice (and available for any future UI needs).

- **[folke/noice.nvim](https://github.com/folke/noice.nvim)**  
  Enhanced commandline, messages, and popupmenu UI. Configured with a popup commandline (`cmdline_popup`), `cmdheight = 0`, and presets for a cleaner UX.

### Colorschemes & visuals

- **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**  
  Main theme (e.g. `tokyonight-moon`), configured with transparent sidebars/floats and additional highlight tweaks for global transparency.

- **[ellisonleao/gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)**  
  Alternative theme (dark gruvbox), with configurable contrast and optional transparent mode.

- **[brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)**  
  Highlights colors in code (hex, rgb, hsl, Tailwind classes, CSS variables, etc.). Configured with background rendering and Tailwind support.

### Core libs, treesitter, pickers, explorer

- **[nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)**  
  Utility library used by Telescope, gitsigns, and other plugins.

- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**  
  Fuzzy finder (files, grep, buffers, help). Bound under `<leader>f…` (e.g. `<leader>ff`, `<leader>fg`, `<leader>fb`, `<leader>fh`).

- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**  
  Treesitter core for syntax highlighting and indentation. Parsers installed for Lua, TypeScript/JavaScript, TSX, Svelte, HTML, CSS, JSON, Markdown, etc.

- **[nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)**  
  Treesitter-based textobjects and motions for functions, classes, etc.

- **[folke/snacks.nvim](https://github.com/folke/snacks.nvim)**  
  Multi-module plugin. Currently using:
  - **Explorer**: sidebar file explorer (`<leader>e`) with auto-hidden input and transparent background.
  - **Picker**: backend for Explorer and other Snacks pickers.
  - **Lazygit**: themed lazygit integration (`Snacks.lazygit()`), running in a rounded floating window.
  - **Input**: nicer `vim.ui.input` prompts (used by plugins; not the `:` cmdline).

### Git integration

- **[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**  
  Git signs in the sign column with hunk navigation (`]c` / `[c`) and actions (stage/reset/preview, blame, diff). Integrated with `<leader>h…` mappings.

- **[folke/snacks.nvim – lazygit module](https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md)**  
  Lazygit launcher themed from the current colorscheme. Called via `Snacks.lazygit()` (mapped to e.g. `<leader>gg`).

- **[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)** _(optional)_  
  Original lazygit wrapper. Kept for compatibility; Snacks.lazygit is the primary entry point in daily use.

> External dependency: **`lazygit`** binary (installed separately, e.g. `pacman -S lazygit`).

### Tmux integration

- **[christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)**  
  Seamless navigation between Neovim splits and tmux panes via `<C-h/j/k/l>` and `<C-\>`. Requires matching bindings in `~/.tmux.conf`.

### Diagnostics / LSP UX (config, not a plugin)

- Diagnostics configured to:
  - Disable `virtual_text`.
  - Show a non-focusable diagnostic float on `CursorHold` / `InsertLeave`.
  - Disable diagnostics while in Insert mode (buffer-local `vim.diagnostic.enable(false, { bufnr = … })`).

- LSP keymaps installed on `LspAttach`, with `desc` set so which-key can display them, and grouped under an `LSP Actions` prefix (e.g. `g` or `<leader>l`).
