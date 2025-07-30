-- Clangd switch source/header
vim.keymap.set("n", "<leader>i", function()
    if not next(vim.lsp.get_clients({ name = "clangd", bufnr = 0 })) then
        return
    end
    vim.cmd("ClangdSwitchSourceHeader")
end)
