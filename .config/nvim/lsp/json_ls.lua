-- lsp/json_ls.lua
-- author: Olaf Luijks <olafluijks@proton.me>

return {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json", "jsonc" },
    root_markers = { ".git", "package.json", "config.jsonc" },
}
