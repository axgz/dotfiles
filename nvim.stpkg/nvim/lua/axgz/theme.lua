function SetThemeCatppuccin(variant)
    variant = variant or "catppuccin"
    vim.cmd.colorscheme(variant)
end

function SetThemeRosePine(variant)
    variant = variant or "rose-pine"
    vim.cmd.colorscheme(variant)
    -- #151515
    vim.api.nvim_set_hl(0, "Normal", { bg = "#151515" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#151515" })
    -- #1F1D2E
    vim.cmd.highlight("StatusLine guibg=#1F1D2E")
end

function SetThemeVsCode(variant)
    variant = variant or "vscode"
    vim.cmd.colorscheme(variant)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function SetThemeBamboo(variant)
    variant = variant or "bamboo"
    vim.cmd.colorscheme(variant)
end

function SetThemeKanagawa(variant)
    variant = variant or "kanagawa-dragon"
    vim.cmd.colorscheme(variant)
end

function SetThemeNord(variant)
    variant = variant or "nord"
    vim.cmd.colorscheme(variant)
end

function SetThemeOneDark(variant)
    variant = variant or "onedark"
    vim.cmd.colorscheme(variant)
end

function SetThemeNightfox(variant)
    variant = variant or "carbonfox"
    vim.cmd.colorscheme(variant)
end

function SetThemeMelange(variant)
    variant = variant or "melange"
    vim.cmd.colorscheme(variant)
end

function SetThemeTokyonight(variant)
    variant = variant or "tokyonight"
    vim.cmd.colorscheme(variant)
end

function SetThemeVercel(variant)
    variant = variant or "vercel"
    vim.cmd.colorscheme(variant)
end

function SetThemeRusty(variant)
    variant = variant or "rusty"
    vim.cmd.colorscheme(variant)
end

function SetThemeVesper(variant)
    variant = variant or "vesper"
    vim.cmd.colorscheme(variant)
end

function SetThemeSolarized(variant)
    variant = variant or "solarized"
    vim.cmd.colorscheme(variant)
end

function SetThemeDracula(variant)
    variant = variant or "dracula"
    vim.cmd.colorscheme(variant)
end

function SetThemeJellybeans(variant)
    -- use #5F8B51 for comments
    variant = variant or "jellybeans-muted"
    vim.cmd.colorscheme(variant)
    vim.cmd.highlight("StatusLine guifg=#58534f")
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Some notes:
    --  muted background colour: #101010
    --  status line bg colour: #1E1E1C
    --  line number fg colour: #58534F
    --  comment fg colour: #797979
    --  keyword fg colour: #3E3B47
    --  string fg colour: #909C6E
    --  return fg colour: #BD8695
    --  fn name fg colour: #EACE98
end

function SetThemeGithub(variant)
    variant = variant or "github_dark_default"
    vim.cmd.colorscheme(variant)
    -- #1F1F1F vs #151515
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1F1F1F" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1F1F1F" })
    -- #30363D
    vim.cmd.highlight("StatusLine guifg=#6E7681 guibg=#171B22")
end

function SetThemeVague(variant)
    variant = variant or "vague"
    vim.cmd.colorscheme(variant)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- This is a comment
SetThemeKanagawa()
SetThemeRosePine()
SetThemeVague()
SetThemeVsCode()
SetThemeGithub()
SetThemeJellybeans()

