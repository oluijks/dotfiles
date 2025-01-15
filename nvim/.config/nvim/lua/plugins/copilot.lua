return { -- github copilot plugin
  "github/copilot.vim",
  event = "InsertEnter",
  lazy = false,
  autoStart = true,
  config = function()
    require "configs.copilot"
  end,
}
