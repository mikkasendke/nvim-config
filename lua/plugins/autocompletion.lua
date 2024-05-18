local enable_copilot = false
return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"

        local sources = {}

        if enable_copilot then table.insert(sources, { name = "copilot", max_item_count = 1 }) end
        table.insert(sources, { name = "nvim_lsp" })
        table.insert(sources, { name = "luasnip" })
        table.insert(sources, { name = "path" })
        table.insert(sources, { name = "buffer", keyword_length = 4 })

        cmp.setup({
            -- window = { completion = cmp.config.window.bordered(), },
            sources = sources,
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end, },
            mapping = cmp.mapping.preset.insert {
                -- I like Ctrl + j/k for navigation better Ctrl + n/p is just leagacy stuff
                -- ["<C-n>"] = cmp.mapping.select_next_item(),
                -- ["<C-p>"] = cmp.mapping.select_prev_item(),

                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),

                -- German keyboards swap z and y and I learned completing on a german keyboard
                ["<C-z>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete {},

                -- Haven't even tried these yet
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

                -- useful
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            },
            completion = { completeopt = "menu,menuone,noinsert" },
        })
    end,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
                {
                    "L3MON4D3/LuaSnip",
                    version = "v2.*",
                    opts = {},
                    build = (function()
                        if vim.fn.executable "make" == 0 then
                            return
                        end
                        return "make install_jsregexp"
                    end)(),
                    dependencies = {
                        {
                            "rafamadriz/friendly-snippets",
                            config = function()
                                require("luasnip.loaders.from_vscode").lazy_load()
                            end,
                        },
                    },
                },
            },
        },

        {
            "zbirenbaum/copilot-cmp",
            opts = {},
            dependencies = {
                {
                    "zbirenbaum/copilot.lua",
                    enabled = enable_copilot,
                    opts = {
                        suggestion = { enabled = true },
                        panel = { enabled = false }
                    },
                },
            },
        },

        -- unrelated but fits:
        {
            "windwp/nvim-autopairs",
            opts = {},
        },
    },
}
