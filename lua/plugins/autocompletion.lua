local enable_copilot = false
return {
    {
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

                    -- useful but makes < behave weirdly
                    -- ["<C->>"] = cmp.mapping(function()
                    --     if luasnip.expand_or_locally_jumpable() then
                    --         luasnip.expand_or_jump()
                    --     end
                    -- end, { "i", "s" }),
                    -- ["<C-<>"] = cmp.mapping(function()
                    --     if luasnip.locally_jumpable(-1) then
                    --         luasnip.jump(-1)
                    --     end
                    -- end, { "i", "s" }),
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
                enabled = true,
                opts = {},
            },
        },
    },
    {
        'abecodes/tabout.nvim',
        enabled = false,
        lazy = false,
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>',  -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = false,           -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        dependencies = { -- These are optional
            "nvim-treesitter/nvim-treesitter",
            "L3MON4D3/LuaSnip",
            "hrsh7th/nvim-cmp"
        },
        opt = true,              -- Set this to true if the plugin is optional
        event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
        priority = 1000,
    },
}
