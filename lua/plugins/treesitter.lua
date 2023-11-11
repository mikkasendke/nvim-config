return {
    'nvim-treesitter/nvim-treesitter',
    config = function ()
        require'nvim-treesitter.configs'.setup {

            ensure_installed = {
                "rust",
                "cpp",
                "c_sharp",
                "ocaml",
                "php",
                "python",
                "cmake",
                "css",
                "html",
                "javascript",
                "typescript",
                "sql",
                "svelte",
                "toml",

                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
    build = ":TSUpdate"
}
