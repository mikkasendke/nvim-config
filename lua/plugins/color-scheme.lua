local colorscheme = "rose-pine"
-- local colorscheme = "gruvbox"
-- local colorscheme = "tokyonight-moon"
local function standard_stuff()
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
        cond = colorscheme == "rose-pine",
        opts = {
            disable_italics = true,
            disable_background = true,
            styles = {
                italic = false,
            }
        },
        config = function(_, opts)
            require "rose-pine".setup(opts)
            standard_stuff()
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        cond = colorscheme == "gruvbox",
        config = standard_stuff,
    },
    {
        "folke/tokyonight.nvim",
        cond = colorscheme == "tokyonight-moon",
        opts = {
            style = "moon",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = false },
            },
        },
        config = function(_, opts)
            require "tokyonight".setup(opts)
            standard_stuff()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
    },
}
