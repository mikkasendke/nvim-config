return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "VeryLazy" },

    opts = {
        ensure_installed = {
            "rust",
            "cpp",
            "c_sharp",
            "ocaml",
            "php",
            "c",
            "zig",
            "python",
            "cmake",
            "css",
            "html",
            "javascript",
            "typescript",
            "sql",
            "svelte",
            "toml",
            "lua",
            "vim",
            "vimdoc",
            "query",
        },
        auto_install = true,
        sync_install = false,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- meh
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-Space>", -- set to `false` to disable one of the mappings
                node_incremental = "<C-Space>",
                scope_incremental = false,
                node_decremental = "<BS>",
            },
        },
        indent = {
            enable = true,
        },

        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",

                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",

                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["<leader>>f"] = "@function.inner",
                    ["<leader>>c"] = "@class.outer",
                    ["<leader>>a"] = "@parameter.inner",
                },
                goto_previous_start = {
                    ["<leader><f"] = "@function.inner",
                    ["<leader><c"] = "@class.outer",
                    ["<leader><a"] = "@parameter.inner",
                },

                goto_next_end = {
                    ["<leader>>F"] = "@function.inner",
                    ["<leader>>C"] = "@class.outer",
                    ["<leader>>A"] = "@parameter.inner",
                },
                goto_previous_end = {
                    ["<leader><F"] = "@function.inner",
                    ["<leader><C"] = "@class.outer",
                    ["<leader><A"] = "@parameter.inner",
                },
            },
        },
    },
    config = function(_, opts)
        require "nvim-treesitter.configs".setup(opts)
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "windwp/nvim-ts-autotag",
            opts = {},
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
            cond = false,
        },
    },
}
