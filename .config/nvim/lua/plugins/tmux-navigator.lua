-- lua/plugins/tmux_navigator.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    vim.g.tmux_navigator_no_mappings = 1

    -- Only set up navigation if we're actually in tmux
    if not os.getenv("TMUX") then
        return
    end

    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
    map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
    map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
    map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
    map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", opts)
end

return M
