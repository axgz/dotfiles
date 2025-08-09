-- https://github.com/mbbill/undotree

return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set('n', '<leader>z', vim.cmd.UndotreeToggle, { desc = "Undotree - Toggle Menu"})
    end
}

