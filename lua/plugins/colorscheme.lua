-- local default_colorscheme = "rose-pine"
-- local default_colorscheme = "gruvbox"
local default_colorscheme = "tokyonight"

local function load_default()
    vim.cmd("colorscheme " .. default_colorscheme)
end

return {
    {
        "rose-pine/neovim",
        -- cond = colorscheme == "rose-pine",
        lazy = true,
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
        lazy = true,
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
                sidebars = "transparent",
                floats = "transparent",
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
    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = true,
        event = { "BufReadPost", "BufNewFile" }, -- "BufWritePost", maybe too
        main = "ibl",
        config = function()
            local hooks = require "ibl.hooks"
            -- hooks.register(
            --     hooks.type.WHITESPACE,
            --     hooks.builtin.hide_first_space_indent_level
            -- )
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "IblIndentCustom", { fg = "#303040" })
                vim.api.nvim_set_hl(0, "IblIndentScopeCustom", { fg = "#505060" })
            end)
            require("ibl").setup {
                -- enabled = false, -- NOTE: just :IBLToggle
                debounce = 100,
                scope = {
                    show_start = false,
                    show_end = false,
                    highlight = "IblIndentScopeCustom",
                    -- char = "▏",
                },
                indent = {
                    -- char = "▏", -- too thick and left aligned and top to bottom(first one I had)
                    char = "│", -- thin enough but centered and top to bottom
                    -- char = "⎸", -- thin enough and left aligned but not top to bottom
                    highlight = "IblIndentCustom"
                }
            }

            vim.keymap.set("n", "<leader>ibl", function() vim.cmd("IBLToggle") end)
        end,
    },
}
