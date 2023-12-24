return {
    'nvim-telescope/telescope.nvim', version = '0.1.1',
    event = 'VeryLazy',
    config = function ()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>s', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end
        )
        pcall(require('telescope').load_extension, 'fzf')
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
}

