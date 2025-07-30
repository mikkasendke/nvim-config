return {
    "neovim/nvim-lspconfig",
    { "mason-org/mason.nvim",           opts = {}, },
    { "mason-org/mason-lspconfig.nvim", opts = {}, event = { "BufReadPre", "BufNewFile" }, },
    { "norcalli/nvim-colorizer.lua",    opts = {}, },
    {
        "j-hui/fidget.nvim",
        opts = { notification = { window = { winblend = 0, }, }, },
    },
}
