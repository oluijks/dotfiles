local M = {}

function M.setup()
    local conform = require("conform")
    conform.setup({
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
            typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
            svelte = { "biome", "prettierd", "prettier", stop_after_first = true },
            json = { "biome", "prettierd", "prettier", stop_after_first = true },
            css = { "biome", "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            markdown = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        notify_on_error = true,
    })

    -- manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({
            async = true,
            lsp_format = "fallback",
        })
    end, { desc = "Format file or range (Conform)" })
end

return M
