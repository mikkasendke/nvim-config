return {
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },
}
