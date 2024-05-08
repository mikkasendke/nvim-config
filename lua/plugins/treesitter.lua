return {
    "nvim-treesitter/nvim-treesitter",
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
            additional_vim_regex_highlighting = true, -- more colors baby
        },
        autotag = {
            enable = true,
        },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "windwp/nvim-ts-autotag", -- idk if it works right now
    },
}
