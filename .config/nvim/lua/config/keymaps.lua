--[[
Neovim Keymaps Configuration
--]]

local keymap = vim.keymap

-- Text Selection
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Line Movement (VSCode-style)
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Window Management
keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up", silent = true })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down", silent = true })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left", silent = true })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right", silent = true })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect", silent = true })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect", silent = true })

-- Web Development Shortcuts
keymap.set("n", "<leader>np", "<cmd>Telescope package_info<cr>", { desc = "Package info", silent = true })
keymap.set("n", "<leader>rf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format file", silent = true })
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol", silent = true })
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code actions", silent = true })

-- Quick file creation for web projects
keymap.set("n", "<leader>fc", "<cmd>e components/", { desc = "Create component", silent = true })
keymap.set("n", "<leader>fp", "<cmd>e pages/", { desc = "Create page", silent = true })
keymap.set("n", "<leader>fh", "<cmd>e hooks/", { desc = "Create hook", silent = true })
keymap.set("n", "<leader>fu", "<cmd>e utils/", { desc = "Create utility", silent = true })

