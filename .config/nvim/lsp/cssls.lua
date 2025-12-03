-- lsp/cssls.lua
-- author: Olaf Luijks <olafluijks@proton.me>

return {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { ".git", "package.json" },
    settings = {
        css = {
            validate = true,
            lint = { unknownAtRules = "ignore" }
        },
    },
}
