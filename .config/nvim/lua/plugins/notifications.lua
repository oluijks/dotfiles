--[[
Notification and Message System Plugins
--]]

return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      stages = "fade_in_slide_out",
      background_colour = "Normal",
      max_width = 50,
      max_height = 10,
      render = "compact",
    },
  },
}
