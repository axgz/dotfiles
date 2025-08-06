-- https://github.com/rose-pine/neovim

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        local rosepine = require('rose-pine')

        rosepine.setup({
            disable_background = true,
            styles = {
                italic = false
            }
        })
        ColorMyPencils()
    end
}
