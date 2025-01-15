return { -- interface for tree-sitter plugin (syntax highlighting)
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enabled = true,
    },
    ensure_installed = {
      "astro",
      "angular",
      "bash",
      "bibtex",
      "c",
      "cpp",
      "css",
      "desktop",
      "dockerfile",
      "gitignore",
      "go",
      "query",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "latex",
      "lua",
      "markdown",
      "markdown_inline",
      "typescript",
      "rust",
      "svelte",
      "sql",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
}