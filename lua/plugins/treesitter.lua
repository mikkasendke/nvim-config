return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

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
                    [">f"] = "@function.inner",
                    [">c"] = "@class.outer",
                    [">a"] = "@parameter.inner",
                },
                goto_previous_start = {
                    ["<f"] = "@function.inner",
                    ["<c"] = "@class.outer",
                    ["<a"] = "@parameter.inner",
                },

                goto_next_end = {
                    [">F"] = "@function.inner",
                    [">C"] = "@class.outer",
                    [">A"] = "@parameter.inner",
                },
                goto_previous_end = {
                    ["<F"] = "@function.inner",
                    ["<C"] = "@class.outer",
                    ["<A"] = "@parameter.inner",
                },
            },
        },
        autotag = {
            enable = true,
        },
    },
    config = function(_, opts)
        require "nvim-treesitter.configs".setup(opts)
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        {
            "nvim-treesitter/nvim-treesitter-context",
            cond = false,
        },
    },
}
