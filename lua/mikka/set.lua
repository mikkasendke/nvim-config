local is_windows = vim.fn.has("win32")

vim.cmd("language en_US.UTF8")

vim.api.nvim_set_var("netrw_banner", 0)
vim.o.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.smartindent = true
vim.opt.smartindent = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = vim.env.HOME .. "/.local/neovim_undo"

if is_windows then
    vim.opt.undodir = vim.env.HOME .. "/.config/vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 750

vim.opt.colorcolumn = "101"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    desc = "Better mappings for netrw",
    callback = function()
        -- Disable t
        vim.keymap.set("n", "t", "<Nop>", { buffer = true })
    end
})

-- clangd switch source/header
vim.api.nvim_create_autocmd("filetype", {
    pattern = "cpp",
    desc = "Clangd switch source/header",
    callback = function()
        vim.keymap.set("n", "<leader>i", function()
            vim.cmd("ClangdSwitchSourceHeader")
        end)
    end
})

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>>d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader><d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)


vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
