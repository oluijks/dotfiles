-- lua/plugins/which_key.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
	local wk = require("which-key")

	wk.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = false,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			border = "rounded",
		},
		layout = {
			spacing = 4,
			align = "left",
		},
	})

	-- NEW spec
	wk.add({
		{ "<leader>l", group = "LSP Actions" },
		-- { "<leader>e", group = "explorer" },
		{ "<leader>f", group = "Find with telescope" },
		-- { "<leader>g", group = "git" },
		-- { "<leader>h", group = "hunks" },
		-- { "<leader>t", group = "toggle" },
	}, { mode = "n" })
end

return M
