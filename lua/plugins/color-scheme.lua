-- local default_colorscheme = "rose-pine"
local default_colorscheme = "gruvbox"
-- local default_colorscheme = "tokyonight-moon"
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(e)
        -- print(e.match)

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
})

local function load_default()
    vim.cmd("colorscheme " .. default_colorscheme)
end

return {
    {
        "rose-pine/neovim",
        -- cond = colorscheme == "rose-pine",
        opts = {
            disable_italics = true,
            disable_background = true,
            styles = {
                italic = false,
            }
        },
        config = function(_, opts)
            require "rose-pine".setup(opts)
            load_default()
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        -- cond = colorscheme == "gruvbox",
        config = load_default,
    },
    {
        "folke/tokyonight.nvim",
        -- cond = colorscheme == "tokyonight-moon",
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
            load_default()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
        opts = {},
    },
}
