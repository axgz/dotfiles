-- https://github.com/rebelot/kanagawa.nvim

return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            transparent = false,
        })
    end
}

