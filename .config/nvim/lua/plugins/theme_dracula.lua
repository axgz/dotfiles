-- sfds

return {
    'Mofiqul/dracula.nvim',
    config = function()
        require('dracula').setup({
            transparent_bg = false, -- default false
            -- set custom lualine background color
            -- lualine_bg_color = "#44475a", -- default nil
            -- set italic comment
            italic_comment = true, -- default false
        })
    end
}

