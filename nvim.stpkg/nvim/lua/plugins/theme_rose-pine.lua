-- https://github.com/rose-pine/neovim

return {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },
            styles = {
                bold = true,
                italic = true,
                transparency = true
            }
        })
    end
}

