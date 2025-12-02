-- lua/config/autocmd.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local ag = vim.api.nvim_create_augroup("highlight-yank", { clear = true })

-- highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = ag,
    callback = function()
        vim.highlight.on_yank()
    end,
})
