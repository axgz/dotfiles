function SetThemeCatppuccin(variant)
    variant = variant or "catppuccin"
    vim.cmd.colorscheme(variant)
end

function SetThemeRosePine(variant)
    variant = variant or "rose-pine"
    vim.cmd.colorscheme(variant)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function SetThemeVsCode(variant)
    variant = variant or "vscode"
    vim.cmd.colorscheme(variant)
end

SetThemeVsCode()

