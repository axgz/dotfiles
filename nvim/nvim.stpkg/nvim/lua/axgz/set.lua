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
vim.opt.listchars = "trail:▒,tab:»."

vim.opt.spell = true
vim.opt.spelllang = "en_au"

local function lsp_format_on_save()
    vim.lsp.buf.format()
end

local function remove_trailing_spaces()
    -- Search and replace trailing whitespaces
    vim.cmd([[keeppatterns %s/\s\+$//e]])
end

local function add_single_trailing_line_if_missing()
    local buf = vim.api.nvim_get_current_buf()
    local buf_line_count = vim.api.nvim_buf_line_count(buf)
    local last_nonblank = vim.fn.prevnonblank(buf_line_count)
    if last_nonblank == 0 then
        return -- Do nothing, buffer is empty or all blank
    end
    if buf_line_count == last_nonblank then
        vim.api.nvim_buf_set_lines(buf, buf_line_count, buf_line_count, false, { "" })
    end
end

local function remove_excess_trailing_lines()
    local buf = vim.api.nvim_get_current_buf()
    local buf_line_count = vim.api.nvim_buf_line_count(buf)
    local last_nonblank = vim.fn.prevnonblank(buf_line_count)
    if last_nonblank == 0 then
        return -- Buffer is empty or all blank
    end
    local start_delete = last_nonblank + 2
    if start_delete <= buf_line_count then
        vim.api.nvim_buf_set_lines(buf, start_delete - 1, buf_line_count, false, {})
    end
end

local function reset_row(row)
    local buf = vim.api.nvim_get_current_buf()
    local buff_lines = vim.api.nvim_buf_line_count(buf)
    if row > buff_lines then
        row = buff_lines
    end
    if row < 1 then
        row = 1
    end
    return row
end

local function reset_col(row, col)
    local line_text = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
    local line_cols = vim.fn.strdisplaywidth(line_text)
    if col > line_cols then
        col = line_cols
    end
    return col
end

local function format_on_save()
    local win = vim.api.nvim_get_current_win()

    -- Save cursor position (1-based row, 0-based col)
    local cursor = vim.api.nvim_win_get_cursor(win)

    local row = cursor[1]
    local col = cursor[2]

    lsp_format_on_save()
    remove_trailing_spaces()
    add_single_trailing_line_if_missing()
    remove_excess_trailing_lines()

    -- Restore cursor
    row = reset_row(row)
    col = reset_col(row, col)
    vim.api.nvim_win_set_cursor(win, { row, col })
end

-- Perform pre save edits
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Ensure 1 lines at eof",
    group = vim.api.nvim_create_augroup("buf_eof", { clear = true }),
    pattern = '*',
    callback = function()
        format_on_save()
    end
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text when yanking",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 800
        })
    end
})

-- Set terminal cursor to a blinking bar when exiting nvim
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("restore_cursor_augroup", { clear = true }),
    callback = function()
        vim.opt.guicursor = "a:ver25,a:blinkwait700-blinkoff400-blinkon175"
    end,
})

-- Alow wrap for markdown files
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("line_wrap_for_markdown", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true -- Optional: breaks by word rather than character
    end,
})

-- Override Makefile specific settings
vim.api.nvim_create_autocmd('FileType', {
    desc = "Ensure tabs are used on Makefiles instead of spaces",
    callback = function(event)
        if event.match == 'make' then
            vim.opt_local.expandtab = false
        end
    end
})

