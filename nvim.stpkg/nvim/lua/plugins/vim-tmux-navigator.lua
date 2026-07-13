return {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "TMUX - Nav Pane Left" })
        vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "TMUX - Nav Pane Down" })
        vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "TMUX - Nav Pane Up" })
        vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "TMUX - Nav Pane Right" })
    end,
}
