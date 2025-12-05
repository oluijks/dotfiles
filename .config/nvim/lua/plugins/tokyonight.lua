-- lua/plugins/colorscheme.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

local function enable_transparency()
	local hl = vim.api.nvim_set_hl

	hl(0, "Normal", { bg = "NONE" })
	hl(0, "NormalNC", { bg = "NONE" })
	hl(0, "NormalFloat", { bg = "NONE" })
	hl(0, "FloatBorder", { bg = "NONE" })
	hl(0, "LineNr", { bg = "NONE" })
	hl(0, "SignColumn", { bg = "NONE" })
	hl(0, "Directory", { bg = "NONE" })
end

function M.setup()
	require("tokyonight").setup({
		style = "moon",
		transparent = true,
		styles = {
			floats = "transparent",
			sidebars = "transparent",
		},
	})

	vim.cmd.colorscheme("tokyonight")

	enable_transparency()
end

return M
