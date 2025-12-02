-- lua/config/keymaps.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local keymap = vim.keymap

-- Text Selection
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Line Movement (VSCode-style)
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
