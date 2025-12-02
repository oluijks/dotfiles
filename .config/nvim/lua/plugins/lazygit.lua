-- lua/plugins/lazygit.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    -- Optional: configure integration with Telescope if you want
    local ok_telescope, telescope = pcall(require, "telescope")
    if ok_telescope then
        telescope.load_extension("lazygit")
    end

    -- Keymaps for lazygit
    local map = vim.keymap.set

    -- Open lazygit in a floating window in the current repo
    map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit (repo)" })

    -- Open lazygit in the repo of the current file (very handy in monorepos)
    map("n", "<leader>gG", "<cmd>LazyGitCurrentFile<CR>", { desc = "LazyGit (file repo)" })

    -- If you use Neovim’s built-in terminal mode a lot, you might also like:
    map("n", "<leader>gl", "<cmd>LazyGitFilter<CR>", { desc = "LazyGit log (filter)" })
end

return M
