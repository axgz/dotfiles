-- https://github.com/stevearc/conform.nvim

return {
    'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" }
            }
        })
    end
}

