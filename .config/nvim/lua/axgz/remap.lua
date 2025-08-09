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
vim.keymap.set("n", "<leader>\\", ":vsplit<CR>", { desc = "NeoVim - Split Vertically" })
vim.keymap.set("n", "<leader>-", ":split<CR>", { desc = "NeoVim - Split Horizontally" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "NeoVim - Nav Pane Left" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "NeoVim - Nav Pane Down" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "NeoVim - Nav Pane Up" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "NeoVim - Nav Pane Right" })

-- Use Ctrl+z to undo
vim.keymap.set("n", "<C-z>", "u", { desc = "NeoVim - Undo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "NeoVim - Undo" }) -- <C-o> in insert mode is used to send exec a single normal mode command

-- Use Ctrl+Shift+z to redo
vim.keymap.set("n", "<C-r>", "<C-o><C-r>", { desc = "NeoVim - Redo" })
vim.keymap.set("i", "<C-r>", "<C-o><C-r>", { desc = "NeoVim - Redo" })

-- Open netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Netrw - Toggle Menu" })

-- Move selected chunks
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "NeoVim - Move Selected Chunk Up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "NeoVim - Move Selected Chunk Down" })

-- Keep J in place when appending
vim.keymap.set("n", "J", "mzJ`z", { desc = "NeoVim - Append The Below Line" })

-- Keep cursor in the middle when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "NeoVim - Half Page Jump Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "NeoVim = Half Page Jump Up" })

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "NeoVim - Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "NeoVim - Prev Search Result" })

-- Retain current paste buffer when pasting using <leader>p
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "NeoVim - Paste and Keep" })

-- Yank to clipboard by preceeding yank with <leader>y
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "NeoVim - Yank to Clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "NeoVim - Yank to Clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "NeoVim - Yank Line to Clipboard" })

-- Delete to void by using <leader>d
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "NeoVim - Delete to Void" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "NeoVim - Delete to Void" })

-- Never use this
vim.keymap.set("n", "Q", "<nop>")

-- Qick-fix navigation
-- ToDo

-- Find and Replace the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "NeoVim - Find and Replace Current Word" })

-- Set/unset file as executable
vim.keymap.set("n", "<leader>+x", "<cmd>!chmod +x %<CR>", { desc = "NeoVim - Run chmod +x On This File", silent = true })
vim.keymap.set("n", "<leader>_x", "<cmd>!chmod -x %<CR>", { desc = "NeoVim - Run chmod -x On This File", silent = true })

-- Close current buffer
vim.keymap.set("n", "<leader>fc", ":bd<CR>", { desc = "NeoVim - Close Buffer" })
vim.keymap.set("n", "<leader>fC", ":bd!<CR>", { desc = "NeoVim - Close Buffer (Force)" })

