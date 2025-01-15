--- Plugins configuration

return {
  { -- formatter plugin
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    opts = require "configs.conform",
  },
  { -- configs for various lsp servers plugin
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
