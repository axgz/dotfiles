-- https://github.com/stevearc/conform.nvim

return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" }
            }
        })
    end
}
