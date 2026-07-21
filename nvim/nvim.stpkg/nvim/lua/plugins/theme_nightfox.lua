-- https://github.com/gbprod/nord.nvim
-- https://daltonlens.org/evaluating-cvd-simulation/#Generating-Ishihara-like-plates-for-self-evaluation

-- sRGB
-- ----
-- Protan: 0.9
-- Deutan: 1.0
-- Tritan: 0.7

return {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nightfox').setup({
            options = {
                transparent = false,
                colorblind = {
                    enable = false,
                    severity = {
                        protan = 0.9,
                        deutan = 1.0,
                        tritan = 0.7,
                    },
                },
            }
        })
    end
}

