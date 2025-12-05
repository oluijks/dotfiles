-- lua/config/lsp.lua
-- author: Olaf Luijks <olafluijks@proton.me>

vim.lsp.enable("lua_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("json_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("svelte")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = {
                "menu",
                "menuone",
                "noinsert",
                "fuzzy",
                "popup",
            }
            vim.lsp.completion.enable(true, client.id, ev.buf, {
                autotrigger = true,
            })
            vim.keymap.set("i", "<C-Space>", function()
                vim.lsp.completion.get()
            end)

            local buf = ev.buf
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
            end

            map("n", "<leader>lk", vim.lsp.buf.hover, "Hover")
            map("n", "<leader>ld", vim.lsp.buf.definition, "Go to definition")
            map("n", "<leader>lD", vim.lsp.buf.declaration, "Go to declaration")
            map("n", "<leader>li", vim.lsp.buf.implementation, "Go to implementation")
            map("n", "<leader>lo", vim.lsp.buf.type_definition, "Go to type definition")
            map("n", "<leader>lr", vim.lsp.buf.references, "Go to references")
            map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
            map("n", "<leader>ll", vim.diagnostic.open_float, "Line diagnostics")
            map("n", "<leader>lrn", vim.lsp.buf.rename, "Rename symbol")
            map({ "n", "x" }, "<leader>lf", function()
                vim.lsp.buf.format({ async = true })
            end, "Format (LSP)")
            map("n", "<leader>la", vim.lsp.buf.code_action, "Code actions")
        end
    end,
})

local group = vim.api.nvim_create_augroup("DiagnosticsFloat", { clear = true })

local function au(events, opts)
    opts = opts or {}
    opts.group = group
    vim.api.nvim_create_autocmd(events, opts)
end

-- Show diagnostics float at cursor on CursorHold / InsertLeave
au({ "CursorHold", "InsertLeave" }, {
    callback = function(args)
        -- Only bother if there are diagnostics here
        local diags = vim.diagnostic.get(args.buf, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
        if vim.tbl_isempty(diags) then
            return
        end

        vim.diagnostic.open_float(nil, {
            focusable = false,
            scope = "cursor",
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        })
    end,
})

au("InsertEnter", {
    callback = function(args)
        vim.diagnostic.enable(false, { bufnr = args.buf })
    end,
})

au("InsertLeave", {
    callback = function(args)
        vim.diagnostic.enable(true, { bufnr = args.buf })
    end,
})

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = false,
    severity_sort = true,
    float = {
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
        },
    },
})
