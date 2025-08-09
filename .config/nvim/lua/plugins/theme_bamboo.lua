-- https://github.com/ribru17/bamboo.nvim

return {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('bamboo').setup {
            transparent = true
        }
        require('bamboo').load()
    end
}

