-- lua/plugins/telescope.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				},
			},
		},
	})

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
	vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Old files" })
	vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quick fix" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

	-- rip grep + fzf
	vim.keymap.set("n", "<leader>fg", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end, { desc = "Grep string: " })

	-- find instance instance of current view being included
	vim.keymap.set("n", "<leader>fc", function()
		local filename_without_extension = vim.fn.expand("%:t:r")
		builtin.grep_string({ search = filename_without_extension })
	end, { desc = "Find current file: " })

	-- grep current string (for when gd doesn't work)
	vim.keymap.set("n", "<leader>fs", function()
		builtin.grep_string({})
	end, { desc = "Grep string: " })

	-- find files in vim config
	vim.keymap.set("n", "<leader>fi", function()
		builtin.find_files({ cwd = "~/.config/nvim/" })
	end, { desc = "Find in config" })
end

return M
