-- Blink.cmp configuration to work with CopilotChat
return {
  {
    "saghen/blink.cmp",
    opts = {
      -- Disable blink.cmp for copilot-chat filetype
      enabled = function()
        return vim.bo.filetype ~= "copilot-chat"
      end,
    },
  },
}
