# dotfiles

## Bindings

Super+1..n          Switch context to workspace
Super+Shift+1..n    Move window to workspace

Ctrl+Space          Escape binding for tmux

Space               Escape binding for nvim (aka `<leader>`)

### tmux

Ctrl+Space L        Switch to/from previous session
Ctrl+Space 1..n     Switch to window

Ctrl+Space r        Reload (source) tmux config
Ctrl+Space rb       Reload (source) bash config
Ctrl+Space f        Find a project dir and start a new session there
Ctrl+Space b        Display this file

Ctrl+Space R        Open the 'repo' project
Ctrl+Space N        Open the 'notes' project
Ctrl+Space D        Open the 'dotfile' project

### netrw (file manager in nvim)

d   Create a directory
%   Create a file
D   Delete
R   Move
i   Toggle tree view

### nvmin (normal mode)

NAV:
        i Up                                            [remap.lua]
j Left  k Down  l Right                                 [remap.lua]

Space e         Open netrw                              [remap.lua]

Space ff        Find file in project scope              [telescope.lua]
Space fg        Find git file in repo                   [telescrop.lua]
Space fs        Find search string in files             [telescope.lua]

Space h         Toggle harpoon menu                     [harpoon.lua]
Space a         Add current file to harpoon menu        [harpoon.lua]
Space 1..n      Switch to file in harpoon menu          [harpoon.lua]

Space z         Toggle undotree menu                    [undotree.lua]

Space gs        Git                                     [fugitive.lua]

gd              lsp.buf.definition                      [lsp.lua]
K               lsp.buf.hover                           [lsp.lua]
Space vca       lsp.buf.code_action                     [lsp.lua]
Space vrr       lsp.buf.references                      [lsp.lua]
Space k         lsp.buf.rename                          [lsp.lua]
Space vws       lsp.buf.workspace_symbol                [lsp.lua]

Space vd        diagnostic.open_float                   [lsp.lua]
Space [d        diagnostic.goto_next                    [lsp.lua]
Space ]d        diagnostic.goto_prev                    [lsp.lua]

### nvim (Insert mode)

NAV:
        i Up                                            [remap.lua]
j Left  k Down  l Right                                 [remap.lua]

Ctrl+h  lsp.buf.signature_help                          [lsp.lua]

### nvim (Visual mode)

NAV:
        i Up                                            [remap.lua]
j Left  k Down  l Right                                 [remap.lua]

### nvim (Window mode)

NAV:
             Ctrl+i Up                                  [remap.lua]
Ctrl+j Left  Ctrl+k Down  Ctrl+l Right                  [remap.lua]

## Commands

:LspInfo            Show the current LSP client status
:Mason              Open the Mason UI for finding and installing Language Servers
:TSPlaygroundToggle Show the Treesitter AST for the current file




