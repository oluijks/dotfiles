-- lsp/rust_analyzer.lua
-- author: Olaf Luijks <olafluijks@proton.me>

return {
    cmd = { "rust-analyzer" },
    filetypes = {
        "rust",
    },
    root_markers = {
        ".git",
        "Cargo.toml",
        "rust-project.json",
    },
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            formatting = {
                command = { "rustfmt" },
            },
        },
    },
}
