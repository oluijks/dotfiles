local M = {}

function M.setup()
    require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_indent_guides = false,
        inverse = true,
        contrast = "hard",
        dim_inactive = false,
        transparent_mode = true,
    })
    vim.cmd("colorscheme gruvbox")

    -- pick a light warm grey from the Gruvbox palette
    local blame_color = "#a89984"

    -- For gitsigns current line blame
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
        fg = blame_color,
        italic = true,
    })

    -- For f-person/git-blame.nvim
    vim.api.nvim_set_hl(0, "GitBlameVirtualText", {
        fg = blame_color,
        italic = true,
    })
end

return M
