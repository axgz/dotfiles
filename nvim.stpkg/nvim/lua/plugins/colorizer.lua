return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        user_default_options = {
            names = false, -- "Name" codes like Blue or red.
            RGB = true, -- #RGB hex codes
            RGBA = true, -- #RGBA hex codes
            RRGGBB = true, -- #RRGGBB hex codes
            mode = "virtualtext", -- Highlighting mode.  'background'|'foreground'|'virtualtext'
            virtualtext = "■", -- Virtualtext character to use
            virtualtext_inline = "before", -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
        },
    },
}
