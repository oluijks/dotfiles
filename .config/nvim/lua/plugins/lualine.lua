-- lua/plugins/lualine.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    require("lualine").setup({
        opts = {
            globalstatus = true,
        },
    })
end

return M
