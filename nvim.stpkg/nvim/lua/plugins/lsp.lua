-- lsp.lua
-- Here we configure the multiple plugins needed for LSPs and completions.

return {

    -- mason (:Mason)
    -- -----
    -- Provides the :Mason UI and engine for downloading and installing LSPs.
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    -- mason-lspconfig
    -- ---------------
    -- Not really sure if this is a wrapper to lsp-config or a shim. It allows us
    --  to ensure certain LSPs are always installed. I think it also allows us to
    --  auto install LSPs upon opening a file - not sure.
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end,
    },

    -- lspconfig (:LspInfo) (:help vim.lsp.buf)
    -- ---------
    -- Allows us to tell nvim to hook-up to LSPs after they have been installed. Not
    --  really sure which plugin starts the LSP but my bet is that is's done in
    --  here. I think there is a way to configure this with mason-lspconfig to auto
    --  install LSPs.
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('lua_ls', {})

            -- Here is where I would like to define any remaps for go-to-definition etc.
            --  Use `:help vim.lsp.buf` to discover func names.
            --  Use `:help lsp` to discover default mappings
            -- These GLOBAL keymaps are created unconditionally when Nvim starts:
            -- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
            -- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
            -- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
            -- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
            -- - "grt" is mapped in Normal mode to |vim.lsp.buf.type_definition()|
            -- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
            -- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|

            -- Set binding only when an LSP attaches to a buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspBindings", { clear = true }),
                callback = function(ev)
                    vim.keymap.set(
                        "n",
                        "<leader>gD",
                        vim.lsp.buf.type_definition,
                        { buffer = ev.buf, desc = "LSP - Type Definition" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>gd",
                        vim.lsp.buf.definition,
                        { buffer = ev.buf, desc = "LSP - Definition" }
                    )
                    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP - Rename" })
                    vim.keymap.set(
                        "n",
                        "<leader>vdi",
                        vim.diagnostic.open_float,
                        { buffer = ev.buf, desc = "LSP - Diagnostics" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>vws",
                        vim.lsp.buf.workspace_symbol,
                        { buffer = ev.buf, desc = "LSP - Workspace Symbol" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>vrr",
                        vim.lsp.buf.references,
                        { buffer = ev.buf, desc = "LSP - References" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>vca",
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf, desc = "LSP - Code Actions" }
                    )
                    vim.keymap.set(
                        "i",
                        "<C-.>",
                        vim.lsp.buf.code_action,
                        { buffer = ev.buf, desc = "LSP - Code Actions" }
                    )
                    vim.keymap.set("n", "<leader>v==", vim.lsp.buf.format, { buffer = ev.buf, desc = "LSP - Format" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP - Hover" })
                    vim.keymap.set(
                        "i",
                        "<C-h>",
                        vim.lsp.buf.signature_help,
                        { buffer = ev.buf, desc = "LSP - Signature Help" }
                    )
                end,
            })
        end,
    },

    -- lazydev
    -- -------
    -- The lua_ls LSP needs more information to work with neovim lua config files.
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        config = function()
            require("lazydev").setup({
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            })
        end,
    },

    -- blink (:Blink status)
    -- -----
    -- Provides an all in one solution for completion, it's only real dependencies
    --  is friendly-snippets which doesn't require any non-default config from us.
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        config = function()
            require("blink.cmp").setup({
                appearance = {
                    nerd_font_variant = "mono",
                },
                completion = {
                    documentation = { auto_show = true },
                    list = { selection = { preselect = false, auto_insert = true } },
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
                signature = { enabled = true },
                -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
                -- 'super-tab' for mappings similar to vscode (tab to accept)
                -- 'enter' for enter to accept
                -- 'none' for no mappings
                --
                -- All presets have the following mappings:
                -- C-space: Open menu or open docs if already open
                -- C-n/C-p or Up/Down: Select next/previous item
                -- C-e: Hide menu
                -- See :h blink-cmp-config-keymap for defining your own keymap
                keymap = {
                    preset = "super-tab",

                    -- Use Tab to cycle through completions
                    --  nb this needs to be paired with `completion.list.selection.preselect` = false (see above)
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },

                    -- Use Esc to cancel
                    ["<Esc>"] = { "cancel", "fallback" },

                    -- Don't let blink eat these keys
                    ["<Enter>"] = { "fallback" },
                    ["<Up>"] = { "fallback" },
                    ["<Down>"] = { "fallback" },

                    -- Add additional accept keys
                    ["<C-y>"] = { "accept", "fallback" }
                },
            })
        end,
    },

    -- none-ls
    -- -------
    -- Fork of null-ls used to wrap tools as generic LSPs
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.completion.spell,
                },
            })
        end,
    },
}
