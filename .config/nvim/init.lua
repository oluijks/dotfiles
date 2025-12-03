-- init.lua
-- author: Olaf Luijks <olafluijks@proton.me>

require("config.globals")
require("config.options")
require("config.autocmd")
require("config.keymaps")
require("config.lsp")

require("plugins.snacks").setup()
require("plugins.conform").setup()
require("plugins.lualine").setup()
require("plugins.lazygit").setup()
require("plugins.gitsigns").setup()
require("plugins.telescope").setup()
require("plugins.treesitter").setup()
require("plugins.gruvbox").setup()
-- require("plugins.colorscheme").setup()
require("plugins.highlight-colors").setup()
