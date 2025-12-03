-- lua/plugins/highlight-colors.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    require("nvim-highlight-colors").setup({
        enable_tailwind = true,
    })
end

return M
