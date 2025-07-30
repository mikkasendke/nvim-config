vim.cmd.language "en_US.utf8"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nobl nowrap ro rnu nu" -- NOTE: default options just with nu and rnu
vim.g.netrw_list_hide = [[_templ.go$,^\..*]]

vim.o.title = true
vim.o.titlestring = [[%t - %{fnamemodify(getcwd(), ':t')} - nvim]]

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "101"
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.winborder = "rounded"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.env.HOME .. "/.local/neovim_undo"

vim.o.updatetime = 200
vim.o.timeoutlen = 350

vim.diagnostic.config {
    -- virtual_lines = { current_line = true, },
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        }
    },
}

-- keymaps:

vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")

vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set({ "n", "v" }, "<leader>c", "\"+")

vim.keymap.set("n", "<C->>", function() vim.cmd("m+1") end)
vim.keymap.set("n", "<C-<>", function() vim.cmd("m-2") end)

vim.keymap.set("i", "<C-l>", "<right>")

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)

require("plugin_manager")

-- notes:
-- vim.o.guicursor take a look at this someday
-- vim.opt.isfname:append("@-@") -- allows file names with @ ????

-- vim.o.smartindent = false -- not needed off by default and off cause of treesitter indent too
-- vim.o.backup = false -- not needed off by default
-- vim.o.incsearch = true -- not needed on by default

-- vim.api.nvim_create_autocmd("TextYankPost", { -- maybe this auto command
--     callback = function()
--         vim.hl.on_yank()
--     end,
-- })
