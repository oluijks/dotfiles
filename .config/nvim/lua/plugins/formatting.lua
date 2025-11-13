--[[
Enhanced Formatting Configuration for Web Development
--]]

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Add our preferred formatters without overriding LazyVim defaults
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      -- Only set preferences for specific file types
      opts.formatters_by_ft.astro = { "prettier" }
      opts.formatters_by_ft.javascript = { "biome", "prettier" }
      opts.formatters_by_ft.typescript = { "biome", "prettier" }
      opts.formatters_by_ft.javascriptreact = { "biome", "prettier" }
      opts.formatters_by_ft.typescriptreact = { "biome", "prettier" }

      return opts
    end,
  },
}
