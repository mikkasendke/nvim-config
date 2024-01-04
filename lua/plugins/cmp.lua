return {
    'hrsh7th/nvim-cmp',
        config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            sources = {
                -- { name = "copilot", max_item_count = 0 },
                -- { name = "nvim_lsp" },
                -- { name = "path" },
                -- { name = "luasnip" },
                { name = "buffer", keyword_length = 5 }
            },
            mapping = {
                ['<C-b>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-z>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }
        })
    end
}

