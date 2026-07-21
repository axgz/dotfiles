return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            columns = {
                -- "icons",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            delete_to_trash = true,
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
            },
            keymaps = {
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
                ["<C-l>"] = false,
            },
        })
        vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Oil - Toggle Parent Directory" })
    end,
}
