return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    -- event = "VeryLazy", -- prevents ls from attaching when starting nvim with file path parameter
    -- event = "LazyFile",
    event = { "BufReadPost", "BufNewFile" }, -- "BufWritePost", maybe too
    config = function()
        local lsp = require("lsp-zero")

        lsp.preset("recommended")
        lsp.ensure_installed({
            "rust_analyzer",
            -- "clangd",
            -- "asm_lsp",
            -- "csharp_ls",
            -- "tsserver",
            -- "eslint",
            -- "emmet_language_server",
            -- "jsonls",
            -- "html",
            "lua_ls",
        })

        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--completion-style=bundled", -- overloads are grouped and such
            }
        }

        lspconfig.emmet_language_server.setup {
            filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "pug",
                "typescriptreact",
                "templ"
            },
        }

        -- lspconfig.tailwindcss.setup({
        --     filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        --     settings = {
        --         tailwindCSS = {
        --             includeLanguages = {
        --                 templ = "html",
        --             },
        --         },
        --     },
        -- })

        vim.diagnostic.config({ --[[ virtual_lines = true, ]] virtual_text = true })

        -- local function get_lua_lib()
        --     return "" --or not vim.api.nvim_get_runtime_file("", true)
        -- end
        --
        -- lspconfig.lua_ls.setup {
        --     settings = {
        --         Lua = {
        --             runtime = {
        --                 version = "LuaJIT",
        --             },
        --             -- workspace = {
        --             --     library = get_lua_lib()
        --             -- },
        --         },
        --     },
        -- }

        local locations_to_items = vim.lsp.util.locations_to_items
        vim.lsp.util.locations_to_items = function(locations, offset_encoding)
            local lines = {}
            local loc_i = 1
            for _, loc in ipairs(vim.deepcopy(locations)) do
                local uri = loc.uri or loc.targetUri
                local range = loc.range or loc.targetSelectionRange
                if lines[uri .. range.start.line] then -- already have a location on this line
                    table.remove(locations, loc_i)     -- remove from the original list
                else
                    loc_i = loc_i + 1
                end
                lines[uri .. range.start.line] = true
            end

            return locations_to_items(locations, offset_encoding)
        end


        lsp.set_preferences({
            sign_icons = {}
        })
        lsp.on_attach(function(client, buffnr)
            --     local opts = { buffer = buffnr, remap = false }
        end)

        lsp.setup()
    end,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
            },
        },
        {
            "norcalli/nvim-colorizer.lua",
            opts = {},
        }
    },
}
