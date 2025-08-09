-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({})
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon - Add Current Buffer" })
        vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon - Toggle Menu" })
        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon - Select 1" })
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon - Select 2" })
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon - Select 3" })
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon - Select 4" })
        vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon - Select 5" })
        vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Harpoon - Select 6" })
        vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Harpoon - Select 7" })
        vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Harpoon - Select 8" })
        vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "Harpoon - Select 9" })
    end
}

