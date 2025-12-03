-- lua/plugins/snacks.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    local Snacks = require("snacks")

    Snacks.setup({
        explorer = { enabled = true },
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    layout = {
                        auto_hide = { "input" },
                    },
                },
            },
        },
        lazygit = {
            enabled = true,
        },
        styles = {
            lazygit = {
                -- window config for the lazygit float
                border = "rounded", -- <- the border you want
                position = "float", -- ensure it’s a float, not a split
                -- you can also set win options here via `wo = {}` if needed
            },
        },
    })

    local map = vim.keymap.set

    map("n", "<leader>e", function()
        Snacks.explorer()
    end, { desc = "Snacks Explorer" })


    map("n", "<leader>gg", function()
        Snacks.lazygit()
    end, { desc = "LazyGit (Snacks, cwd)" })

    -- optional: root-dir version
    map("n", "<leader>gG", function()
        Snacks.lazygit({ cwd = vim.loop.cwd() })
    end, { desc = "LazyGit (Snacks, root)" })
end

return M
