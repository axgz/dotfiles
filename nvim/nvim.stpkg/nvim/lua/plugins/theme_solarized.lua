-- https://github.com/maxmx03/solarized.nvim?tab=readme-ov-file#manual-installation

return {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.termguicolors = false
        vim.o.background = 'dark'
        require('solarized').setup({
            transparent = {
                enabled = true,
            }
        })
    end
}

