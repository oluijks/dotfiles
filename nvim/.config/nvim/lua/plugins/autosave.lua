return { -- autosave plugin
  "brianhuster/autosave.nvim",
  event = "InsertEnter",
  opts = {},
  config = function()
    vim.g.auto_save_disable_inside_path = { vim.fn.stdpath "config" }
  end,
}
