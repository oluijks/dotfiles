return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "typescript",
    },
    root_markers = {
        ".git",
        "package.json",
        "tsconfig.json"
    },
    settings = {
        completions = {
            completeFunctionCalls = true,
        },
    },
}
