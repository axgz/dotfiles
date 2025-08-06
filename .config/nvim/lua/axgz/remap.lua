-- Stop crashing
vim.keymap.set('n', '<C-z>', '<nop>')

-- PageUp and PageDown keys are too close to left and right
vim.keymap.set("n", "<PageUp>", "<Left>")
vim.keymap.set("n", "<PageDown>", "<Right>")
vim.keymap.set("i", "<PageUp>", "<Left>")
vim.keymap.set("i", "<PageDown>", "<Right>")
vim.keymap.set("v", "<PageUp>", "<Left>")
vim.keymap.set("v", "<PageDown>", "<Right>")

-- Nav between panes
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>")
vim.keymap.set("n", "<leader>-", ":split<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Use Ctrl+z to undo
vim.keymap.set("n", "<C-z>", "u")
vim.keymap.set("i", "<C-z>", "<C-o>u") -- <C-o> in insert mode is used to send exec a single normal mode command

-- Use Ctrl+Shift+z to redo
vim.keymap.set("i", "<C-r>", "<C-o><C-r>")

-- Open netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move selected chunks
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Keep J in place when appending
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Retain current paste buffer when pasting using <leader>p
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to clipboard by preceeding yank with <leader>y
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void by using <leader>d
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Never use this
vim.keymap.set("n", "Q", "<nop>")

-- Qick-fix navigation
-- ToDo

-- Find and Replace the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set/unset file as executable
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>_x", "<cmd>!chmod -x %<CR>", { silent = true })




