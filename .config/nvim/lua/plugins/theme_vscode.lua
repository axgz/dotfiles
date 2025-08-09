-- https://github.com/Mofiqul/vscode.nvim

return {
    'Mofiqul/vscode.nvim',
    config = function()
        require("vscode").setup({
            transparent = true,

        })
    end
}

