return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.5",
    -- event = "VeryLazy",
    config = function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>s", builtin.find_files, {})
        vim.keymap.set("n", "<leader>tg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>td", builtin.diagnostics, {})
        vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>tn", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config"),
                prompt_title = "Neovim config files",
            })
        end, {})

        pcall(require("telescope").load_extension, "fzf")

        require("telescope").setup {
            defaults = {
                file_ignore_patterns = {
                    "CMakeFiles",
                    "CMakeCache.txt",
                    "cmake_install.cmake",
                    "node_modules",
                },
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<C-q>"] = actions.send_to_qflist,
                    },
                },
            },
        }
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable "make" == 1
            end,
        }
    }
}
