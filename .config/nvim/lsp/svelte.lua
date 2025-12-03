-- lsp/svelte.lua
-- author: Olaf Luijks <olafluijks@proton.me>

return {
    cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
    root_markers = {
        ".git",
        "package.json",
        "svelte.config.js",
    },
}
