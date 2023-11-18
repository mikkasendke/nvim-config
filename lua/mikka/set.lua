vim.api.nvim_exec('language en_US', true)
vim.api.nvim_set_var("netrw_banner", 0)
vim.o.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "C:/Users/Mikka/.config/vim/undodir" -- 💀

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.updatetime = 50

vim.colorcolumn = 80

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
