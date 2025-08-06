-- https://github.com/nvim-treesitter/nvim-treesitter

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local tsconfigs = require("nvim-treesitter.configs")

        tsconfigs.setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            disable = { "python", "c" } -- these and some other langs don't work well
            },
        })
    end
}
