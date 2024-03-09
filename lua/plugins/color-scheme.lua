return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function ()
        require("rose-pine").setup({
            disable_italics = true,
            disable_background = true,
            styles = {
                italic = false,
            }
        })

        vim.cmd('colorscheme rose-pine')

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    end
}
