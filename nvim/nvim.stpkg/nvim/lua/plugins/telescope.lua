-- https://github.com/nvim-telescope/telescope.nvim

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        module = "telescope",
        config = function()
            local telescope = require("telescope")
            local builtin = require('telescope.builtin')

            telescope.setup({})
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope - Files Find" })
            vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope - Files Find (Git Only)" })
            vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope - Files Search" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope - Files Buffer" })
            vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>", { desc = "Telescope - Files Find (Include Hidden)" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}

