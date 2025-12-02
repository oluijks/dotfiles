local M = {}

function M.setup()
    require("lualine").setup({
        opts = {
            globalstatus = true,
        },
    })
end

return M
