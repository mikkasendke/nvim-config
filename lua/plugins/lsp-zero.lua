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
        lsp.on_attach(function(client, buffnr)
            local opts = { buffer = buffnr, remap = false }

            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set('n', '<leader>nd', function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set('n', '<leader>bd', function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, opts)
            vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
        end)

        lsp.setup()
    end
}
