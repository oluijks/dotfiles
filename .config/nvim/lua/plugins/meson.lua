--[[
Meson Build System Support for GNOME Development
--]]

return {
  -- Meson Language Server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mesonlsp = {
          cmd = { "mesonlsp", "--lsp" },
          filetypes = { "meson" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("meson.build", "meson_options.txt", ".git")(fname)
          end,
        },
        -- Configure clangd for Meson projects
        clangd = {
          cmd = { "clangd", "--background-index", "--compile-commands-dir=builddir" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("meson.build", ".clangd", ".git")(fname)
          end,
        },
      },
    },
  },

  -- Meson Treesitter Support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "meson",
      },
    },
  },

  -- Meson file type detection
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.filetype.add({
        filename = {
          ["meson.build"] = "meson",
          ["meson_options.txt"] = "meson",
        },
        pattern = {
          [".*%.wrap"] = "dosini", -- Meson wrap files
        },
      })
    end,
  },
}
