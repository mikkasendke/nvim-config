return {
    'hrsh7th/nvim-cmp',
    config = function ()
        require'cmp'.setup {
            sources = {
                -- { name = "copilot", group_index = 2 },
                { name = "nvim_lsp", group_index = 2 },
                { name = "path", group_index = 2 },
                { name = "luasnip", group_index = 2 },
            }
        }
    end
}
