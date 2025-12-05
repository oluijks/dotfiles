-- lua/plugins/noice.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
	-- hide the old cmdline most of the time
	vim.o.cmdheight = 0

	require("noice").setup({
		cmdline = {
			enabled = true,
			view = "cmdline_popup", -- popup command-line
			format = {
				cmdline = { icon = "", lang = "vim" },
				search_down = { icon = " " },
				search_up = { icon = " " },
				filter = { icon = "$", lang = "bash" },
				lua = { icon = "", lang = "lua" },
				-- you can tweak or remove formats as you like
			},
		},
		messages = {
			enabled = true,
		},
		popupmenu = {
			enabled = true, -- prettier completion menu (for `:` and `/`)
		},
		presets = {
			bottom_search = false, -- keep search in popup instead of bottom
			command_palette = true, -- merges commandline + popupmenu
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	})
end

return M
