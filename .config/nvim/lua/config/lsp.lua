vim.lsp.enable("lua_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("json_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("ts_ls")
vim.lsp.enable("svelte")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and
            client:supports_method(vim.lsp.protocol.Methods.textDocument_completion)
        then
            vim.opt.completeopt = {
                "menu",
                "menuone",
                "noinsert",
                "fuzzy",
                "popup"
            }
            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                {
                    autotrigger = true
                }
            )
            vim.keymap.set("i", "<C-Space>", function()
                vim.lsp.completion.get()
            end)

            local buf = ev.buf
            local map = function(mode, lhs, rhs)
                vim.keymap.set(mode, lhs, rhs, { buffer = buf })
            end

            map("n", "K", vim.lsp.buf.hover)
            map("n", "gd", vim.lsp.buf.definition)
            map("n", "gD", vim.lsp.buf.declaration)
            map("n", "gi", vim.lsp.buf.implementation)
            map("n", "go", vim.lsp.buf.type_definition)
            map("n", "gr", vim.lsp.buf.references)
            map("n", "gs", vim.lsp.buf.signature_help)
            map("n", "gl", vim.diagnostic.open_float)
            map("n", "<F2>", vim.lsp.buf.rename)
            map({ "n", "x" }, "<F3>",
                function()
                    vim.lsp.buf.format({ async = true })
                end)
            map("n", "<F4>", vim.lsp.buf.code_action)
        end
    end,
})

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = true,
    severity_sort = true,
    float         = {
        style  = 'minimal',
        border = 'rounded',
        source = 'if_many',
        header = '',
        prefix = '',
    },
    signs         = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
})
