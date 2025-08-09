return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "auto",
            auto_integrations = false,
        })
        vim.cmd.colorscheme "catppuccin"
    end
}

