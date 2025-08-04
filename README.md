# dotfiles

## Operating System

Fedora 42 Workstation (GNOME)

**Problem with icons not displaying**

Not sure if this fixed it: `sudo dnf reinstall shared-mime-info`

Or if this fixed it:

``` bash
# Install Nerd-Fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip \
&& cd ~/.local/share/fonts \
&& unzip FiraMono.zip \
&& rm FiraMono.zip \
&& fc-cache -fv
```

Add an env var for the font

``` bash
# list all installed Nerd fonts
fc-list | grep Nerd

# ~/.env_vars
export NERD_FONT_NAME="FiraMono Nerd Font Mono"

# ~/.bash_profile
source "$HOME/.env_vars"
```

**Problem with videos not playing (codecs>)**

No idea what fixed this, playback works using hyprland.

## Dependencies

Install the following dependencies.

- stow
- zsh
- - oh-my-zsh
- tmux
- - tpm
- bat
- hyprland
- - kitty (terminal)
- - mako (notification daemon)
- - hyprlock (lock screen)
- - hypridle (power mgmt)
- - hyprpaper (wallpaper)
- - rofi (app launcher)
- neovim

`sudo dnf install zsh zsh-syntax-highlighting`
`sudo dnf install stow hyperland tmux kitty mako rofi nvim bat`
`sudo dnf install --releasever=41 hypridle hyprlock hyprpaper hyprpicker`

### oh-my-zsh

``` bash
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> https://ohmyz.sh/#install

### tpm

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

> https://github.com/tmux-plugins/tpm

### git-credential-manager

>

``` bash
tar -xvf ~/Downloads/gcm-linux_amd64.2.6.1.tar.gz -C /usr/local/bin
git-credential-manager configure
git config --global credential.credentialStore secretservice
```

## Bindings

> Just use `folke/which-key.nvim` for vim bindings instead!

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




