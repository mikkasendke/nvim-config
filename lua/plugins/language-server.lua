return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    -- event = "VeryLazy", prevents ls from attaching when starting nvim with file path parameter
    config = function()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")
        lsp.ensure_installed({
            "rust_analyzer",
            "clangd",
            "asm_lsp",
            "csharp_ls",
            "tsserver",
            "eslint",
            "emmet_language_server",
            "jsonls",
            "html",
            "lua_ls",
        })

        require("lspconfig").clangd.setup({
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--completion-style=bundled", -- overloads are grouped and such
            }
        })


        lsp.set_preferences({
            sign_icons = {}
        })
        lsp.on_attach(function(client, buffnr)
            --     local opts = { buffer = buffnr, remap = false }
        end)

        lsp.setup()
    end,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            },
        },
    },
}
