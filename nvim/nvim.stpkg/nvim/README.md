# Note

Current config really only supports working with the lua language.

To add support for other languages, update `lsp.lua` as follows:

> To find the name of the LSP, run :Mason and search for it there.

1. Add the LSP to the `ensure_installed` table under **mason-lspconfig**, this will install the LSP.
1. Enable the LSP by adding a `lspconfig.the_lsp_name.setup({})` under **lspconfig**.
1. Add any linting/formating or other tools under **none-ls**.
1. If adding other tools, use :Mason to install them, the won't install automatically like LSPs do.

