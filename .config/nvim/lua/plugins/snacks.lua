-- lua/plugins/snacks.lua
-- author: Olaf Luijks <olafluijks@proton.me>

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
		indent = {
			enabled = true,
			only_current = true,
		},
		lazygit = {
			enabled = true,
		},
		notifier = {},
		styles = {
			lazygit = {
				border = "rounded",
				position = "float",
			},
		},
	})

	local map = vim.keymap.set

	map("n", "<leader>e", function()
		Snacks.explorer()
	end, { desc = "Toggle explorer" })

	map("n", "<leader>gg", function()
		Snacks.lazygit()
	end, { desc = "LazyGit (cwd)" })

	map("n", "<leader>gG", function()
		Snacks.lazygit({ cwd = vim.loop.cwd() })
	end, { desc = "LazyGit (root)" })
end

return M
