return {
    "saghen/blink.cmp",
    build = "nix run .#build-plugin",
    opts = {
        keymap = {
            preset = "none",
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },
            ["<C-z>"] = { "select_and_accept" },
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            menu = {
                draw = {
                    -- columns = { { "kind_icon", gap = 1 }, { "label", gap = 1 },  { "source_name" } }
                    columns = { { "label", gap = 1 }, { "kind_icon" } }
                },
                winblend = 0,
            },
            documentation = { auto_show = false },
            ghost_text = { enabled = true },
        },

        -- snippets = { preset = "luasnip" },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },

}
