-- lua/plugins/treesitter.lua
-- author: Olaf Luijks <olafluijks@proton.me>

local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        autotag = { enable = true },
        ensure_installed = {
            "astro",
            "bash",
            "c",
            "css",
            "dockerfile",
            "gitignore",
            "haskell",
            "html",
            "javascript",
            "json",
            "jsonc",
            "kdl",
            -- "latex",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "rust",
            "sql",
            "svelte",
            "toml",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "zig",
        },
        auto_install = false,
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
            },
        },
    })
end

return M
