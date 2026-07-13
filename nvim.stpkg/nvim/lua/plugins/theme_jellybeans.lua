-- https://github.com/wtfox/jellybeans.nvim_echo

return {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        require("jellybeans").setup({
 flat_ui = false
        })
    end
}

