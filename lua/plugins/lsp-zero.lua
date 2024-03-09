return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = 'VeryLazy',
    config = function()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')
        lsp.ensure_installed({
            'rust_analyzer',
            'clangd',
            'asm_lsp',
            'csharp_ls',
            'tsserver',
            'eslint',
            'emmet_language_server',
            'jsonls',
            'html',
            'lua_ls',
        })

        require('lspconfig').clangd.setup({
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy"
            }
        })


        lsp.set_preferences({
            sign_icons = { }
        })
        -- lsp.on_attach(function(client, buffnr)
        --     local opts = { buffer = buffnr, remap = false }
        -- end)

        lsp.setup()
    end
}
