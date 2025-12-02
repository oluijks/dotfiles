-- lua/plugins/snacks.lua
local M = {}

function M.setup()
	local Snacks = require("snacks")

	Snacks.setup({
		explorer = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						auto_hide = { "input" },
					},
				},
			},
		},
	})

	vim.keymap.set("n", "<leader>e", function()
		Snacks.explorer()
	end, { desc = "Snacks Explorer" })
end

return M
