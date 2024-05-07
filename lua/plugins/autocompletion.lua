return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require "cmp"
        local luasnip = require "luasnip"

        cmp.setup({
            sources = {
                -- { name = "copilot", max_item_count = 1 },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer",  keyword_length = 4 }
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),

                ["<C-z>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete {},

                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

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
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
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
                    enabled = true,
                    opts = {
                        suggestion = { enabled = true },
                        panel = { enabled = false }
                    },
                },
            },
        },

        -- unrelated but fits:
        "windwp/nvim-ts-autotag",
        "windwp/nvim-autopairs",
    },
}
