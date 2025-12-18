-- lua/plugins/vimwiki.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
	vim.g.vimwiki_list = {
		{
			path = "~/wiki", -- e.g. ~/wiki or ~/Documents/Notes
			syntax = "default", -- or 'default' if you prefer Vimwiki syntax
			ext = ".wiki", -- file extension
		},
	}

	-- Do NOT treat every .md file as a wiki
	-- Only files under paths in vimwiki_list are special
	vim.g.vimwiki_global_ext = 0

	-- (Optional) disable automatic temp-wiki for random extensions altogether:
	-- vim.g.vimwiki_ext2syntax = {}

	-- (Optional) nicer folding behaviour, if you want it:
	-- vim.g.vimwiki_folding = "expr"
end

return M
