-- https://github.com/tpope/vim-fugitive

return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        vim.keymap.set('n', '<leader>gb', ":Git blame<CR>")
    end
}




