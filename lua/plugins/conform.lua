return {
    'stevearc/conform.nvim',
    opts = {
        format_on_save = function(bufnr)
            return {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        end,
        formatters_by_ft = {
            cpp = { 'clang-format' },
        },
    },
}
