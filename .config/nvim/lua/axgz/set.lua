-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Give undotree plugin access to long running undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

-- Stop 'always' highlight search results but do incremental highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Make sure there are always at least lines at bottom unless at eof
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

-- Highlight trailing white spaces
vim.opt.list = true
vim.opt.listchars = "trail:▒"

vim.opt.spell = true
vim.opt.spelllang = "en_au"

-- Remove trailing white spaces
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Trim trailing white spaces when saving',
    group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
    pattern = '*',
    callback = function()
        -- Save cursor position to restore later
        local curpos = vim.api.nvim_win_get_cursor(0)

        -- Search and replace trailing whitespaces
        vim.cmd([[keeppatterns %s/\s\+$//e]])

        -- Restore cursor
        vim.api.nvim_win_set_cursor(0, curpos)
      end
    })

-- Ensure 1 lines at eof
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Add trailing lines to eof when saving",
    group = vim.api.nvim_create_augroup("buf_eof", {clear = true}),
    pattern = '*',
    callback = function()
        -- Save cursor position to restore later
        local curpos = vim.api.nvim_win_get_cursor(0)

        -- Search and replace empty lines at eof
        vim.cmd([[keeppatterns silent! %s#\($\n\s*\)\+\%$##]])

        -- Add 4 lines at eof ('G' position the cursor at the eof 'o' enter insert mode)
        for _ = 1, 1 do
            vim.cmd("normal! Go\n\n\n")
        end

        -- Restore cursor
        vim.api.nvim_win_set_cursor(0, curpos)
    end
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text when yanking",
    group = vim.api.nvim_create_augroup("highlight_yank", {clear = true}),
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 800
        })
    end
})

-- Set terminal cursor to a blinking bar when exiting nvim
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("restore_cursor_augroup", {clear = true}),
    callback = function()
        vim.opt.guicursor = "a:ver25,a:blinkwait700-blinkoff400-blinkon175"
    end,
})

-- Alow wrap for markdown files
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("line_wrap_for_markdown", {clear = true}),
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true -- Optional: breaks by word rather than character
    end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Run LSP format on save",
    group = vim.api.nvim_create_augroup("format_on_save", {clear = true}),
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end
})

