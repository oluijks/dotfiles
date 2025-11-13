--[[
Lazy.nvim Plugin Manager Bootstrap and Configuration
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "gruvbox",
        news = {
          neovim = true,
          lazyvim = true,
        },
      },
    },
    -- AI and Copilot Integration
    { import = "lazyvim.plugins.extras.ai.copilot" },
    -- { import = "lazyvim.plugins.extras.ai.copilot-chat" },

    -- Web Development Languages
    { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.lang.svelte" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- Systems Programming Languages
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.clangd" },

    -- Configuration and Data Languages
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- DevOps and Tools
    { import = "lazyvim.plugins.extras.lang.git" },
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- Code Formatting
    { import = "lazyvim.plugins.extras.formatting.biome" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- Testing and Development Tools
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.editor.outline" },

    -- Utilities
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },

    -- Custom Plugin Configurations
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- Don't lazy load by default
    version = false, -- Don't use version constraints
  },
  install = {
    colorscheme = {
      "gruvbox", -- Primary colorscheme
      "tokyonight", -- Fallback
      "habamax", -- System fallback
    },
  },
  checker = {
    enabled = true, -- Check for plugin updates
    notify = false, -- Don't notify about updates
  },
  performance = {
    rtp = {
      -- Disable unused built-in plugins for better performance
      disabled_plugins = {
        "gzip",
        -- "matchit", -- Useful for bracket matching
        -- "matchparen", -- Useful for parenthesis highlighting
        -- "netrwPlugin", -- Useful for file browsing
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
