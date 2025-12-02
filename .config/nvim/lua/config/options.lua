local set = vim.opt

set.number = true
set.relativenumber = true

set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true

set.smartcase = true
set.ignorecase = true

set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

set.cursorline = true

set.colorcolumn = "80"

set.clipboard:append("unnamedplus")

set.backspace = "indent,eol,start"

set.splitbelow = true
set.splitright = true

set.iskeyword:append("-")

set.scrolloff = 8

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.incsearch = true

set.updatetime = 50

set.winborder = "rounded"
