-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "cssls",
  "emmet_ls",
  "gopls",
  "html",
  "svelte",
  "tailwindcss",
  "ts_ls",
}

local nvlsp = require "nvchad.configs.lspconfig"

local default_opts = {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configure css language server
lspconfig.cssls.setup {
  on_attach = nvlsp.on_attach,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
  capabilities = nvlsp.capabilities,
}

-- configure emmet language server
lspconfig.emmet_ls.setup {
  capabilities = nvlsp.capabilities,
  on_attach = nvlsp.on_attach,
  filetypes = { "html", "css", "svelte" },
}

-- configure svelte language server
lspconfig.svelte.setup(default_opts, { filetypes = { "svelte" } })

-- configure typescript language server
lspconfig.ts_ls.setup {
  default_opts,
  {
    init_options = { disableSuggestions = false },
  },
}

-- setup eslint - @see @antfu/esling-config
local customizations = {
  { rule = "style/*", severity = "off", fixable = true },
  { rule = "format/*", severity = "off", fixable = true },
  { rule = "*-indent", severity = "off", fixable = true },
  { rule = "*-spacing", severity = "off", fixable = true },
  { rule = "*-spaces", severity = "off", fixable = true },
  { rule = "*-order", severity = "off", fixable = true },
  { rule = "*-dangle", severity = "off", fixable = true },
  { rule = "*-newline", severity = "off", fixable = true },
  { rule = "*quotes", severity = "off", fixable = true },
  { rule = "*semi", severity = "off", fixable = true },
}

lspconfig.eslint.setup {
  filetypes = {
    "astro",
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "jsonc",
    "markdown",
    "pcss",
    "postcss",
    "svelte",
    "toml",
    "typescript",
    "xml",
    "yaml",
  },
  settings = {
    -- Silent the stylistic rules in you IDE, but still auto fix them
    rulesCustomizations = customizations,
  },
}

-- configure eslint
lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
