-- local colorscheme = "rose-pine"
local colorscheme = "gruvbox"
-- local colorscheme = "tokyonight-moon"
local function standard_colorscheme()
    vim.cmd("colorscheme " .. colorscheme)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })

    vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "none" })
end
return {
    {
        "rose-pine/neovim",
        enabled = colorscheme == "rose-pine",
        config = standard_colorscheme,
        opts = {
            disable_italics = true,
            disable_background = true,
            styles = {
                italic = false,
            }
        },
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = colorscheme == "gruvbox",
        config = standard_colorscheme,
    },
    {
        "folke/tokyonight.nvim",
        enabled = colorscheme == "tokyonight-moon",
        config = function()
            require("tokyonight").setup({
                style = "moon",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                },
            })
            standard_colorscheme()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
    },
}
