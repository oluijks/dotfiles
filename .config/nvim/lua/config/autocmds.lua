--[[
Neovim Autocommands Configuration
Custom autocommands for automatic behavior.
--]]

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  pattern = "*",
  command = "set nopaste",
})

-- Auto-create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function(event)
    local file = event.match
    local dir = vim.fn.fnamemodify(file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Close certain filetypes with q
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "qf", "help", "man", "lspinfo", "startuptime" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto-setup Meson projects
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.fn.filereadable("meson.build") == 1 and vim.fn.isdirectory("builddir") == 0 then
      local choice = vim.fn.confirm("Meson project detected. Setup builddir?", "&Yes\n&No", 1)
      if choice == 1 then
        vim.fn.system("meson setup builddir")
        print("Build directory setup complete!")
      end
    end
  end,
})
