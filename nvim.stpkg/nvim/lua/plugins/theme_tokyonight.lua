-- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('tokyonight').setup({
            transparent = false,
        })
    end
}

