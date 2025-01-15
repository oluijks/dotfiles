-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
  ui = {
    cmp = {
      format_colors = {
        tailwind = true,
      },
      style = "atom",
    },
    statusline = {
      theme = "vscode",
    },
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.base46 = {
  theme = "gruvchad",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = {
      bg = "one_bg",
    },
  },
}

return M
