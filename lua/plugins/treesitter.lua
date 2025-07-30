return {
    {
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
            indent = { enable = true, },

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
                        ["]f"] = "@function.inner",
                        ["]c"] = "@class.outer",
                        ["]a"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.inner",
                        ["[c"] = "@class.outer",
                        ["[a"] = "@parameter.inner",
                    },
                },
            },
        },
        config = function(_, opts)
            require "nvim-treesitter.configs".setup(opts)
            vim.keymap.set("n", "<leader>inj", function() vim.cmd("TSEditQueryUserAfter injections") end)
        end,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    { "nvim-treesitter/nvim-treesitter-context", cond = false },
}
