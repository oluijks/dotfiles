--[[
Neovim Options Configuration
--]]

local o = vim.o
local opt = vim.opt
local g = vim.g

-- UI and Display Settings
o.cmdheight = 0
o.laststatus = 3
opt.scrolloff = 9999 -- Keep cursor centered
opt.sidescrolloff = 8
opt.cursorline = true
opt.number = true
opt.relativenumber = true

-- File Handling and Backup Settings
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Search and Replace Settings
opt.ignorecase = true
opt.smartcase = true -- Override ignorecase if search contains uppercase
opt.hlsearch = true
opt.incsearch = true

-- Indentation and Formatting
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Performance and Behavior
opt.updatetime = 250 -- Faster completion
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- Completion settings for CopilotChat
opt.completeopt = { "menu", "menuone", "noselect", "popup" } -- For best CopilotChat experience

vim.opt.guicursor = table.concat({
  "n-v-c:block", -- normal/visual: block
  "i-ci:ver25", -- insert: vertical bar
  "r-cr:hor20", -- replace: horizontal underline
  "o:hor50",
}, ",")

-- Terminal undercurl support
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- LazyVim Global Configuration
g.lazyvim_picker = "fzf"
g.lazyvim_cmp = "blink.cmp" -- Enable blink.cmp (will be disabled for copilot-chat specifically)
g.lazyvim_eslint_auto_format = true
g.lazyvim_prettier_needs_config = true
g.lazyvim_rust_diagnostics = "rust-analyzer"
