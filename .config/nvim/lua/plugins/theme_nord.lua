-- https://github.com/gbprod/nord.nvim

return {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nord').setup({
            transparent = true,
        })
    end
}

