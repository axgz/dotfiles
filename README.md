# dotfiles

## Operating System

Fedora 42 Workstation (GNOME)

**Problem with icons not displaying**

Not sure if this fixed it: `sudo dnf reinstall shared-mime-info` or if installing Nerd Fonts fixed it.

**Problem with videos not playing (codecs>)**

No idea what fixed this, playback started workings after installing hyprland.

## Dependencies

Most of the following dependencies can be installed through Fedora's package manager and will be configured using stow.
The remaining should be installed by referencing their manuals, however, steps taken at the time of writing are below.

Item        | Description
---         | ---
git         | Source control cli
git-credential-manager | Allows use of secretservice for git auth
lazygit     | UI engine for git
stow        | A dotfiles linker
kitty       | Terminal emulator
tmux        | Terminal session managment and multiplexter
tpm         | Package manager for tmux
zsh         | Shell with auto complete
oh-my-zsh   | Package manager for zsh
neovim      | Editor
bat         | Formatted cat
Nerd-Fonts  | Fonts with icons
hyprland    | Tiling window manager / compositor
mako        | Notification daemon (hyprland)
hyprlock    | Lock screen (hyprland)
hypridle    | Power mgmt (hyprland)
hyprpaper   | Wallpaper (hyprland)
rofi        | App launcher (hyprland)

### Packages and stow

``` bash
# Install zsh
dnf install zsh git make stow tmux nvim bat

# Install hyperland
dnf install hyperland kitty mako rofi

# Install Hyprland components
dnf install --releasever=41 hypridle hyprlock hyprpaper hyprpicker
```

### git

``` bash
# Configure git for first use
git config --global user.name axgz
git config --global user.email axgz
```

### git-credential-manager

> https://github.com/git-ecosystem/git-credential-manager/releases

``` bash
# Enable 'matthickford/git-credential-manager' copr repo
dnf copr enable matthickford/git-credential-manager

# Install
dnf install git-credential-manager

# Configure
git-credential-manager configure
git config --global credential.credentialStore secretservice
```

### lazygit

> https://github.com/jesseduffield/lazygit/releases

``` bash
# Enable the 'dejan/lazygit' copr repo
dnf copr enable dejan/lazygit

# Install
dnf install lazygit
```

### Nerd-Fonts

``` bash
# Install Nerd-Fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip \
&& cd ~/.local/share/fonts \
&& unzip FiraMono.zip \
&& rm FiraMono.zip \
&& fc-cache -fv

# list all installed Nerd fonts
fc-list | grep Nerd

# ~/.env_vars
export NERD_FONT_NAME="FiraMono Nerd Font Mono"

# ~/.zshrc
source "$HOME/.env_vars"
```

### oh-my-zsh

> https://ohmyz.sh/#install

``` bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell to zsh
chsh -s /bin/zsh

# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### tpm

> https://github.com/tmux-plugins/tpm

``` bash
# Install tmp
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

## Configure with stow

### Capture

``` bash
mkdir -p ~/dotfiles/.local
mkdir -p ~/dotfiles/.config

cp -ru ~/.zshrc        ~/dotfiles/
cp -ru ~/.bashrc       ~/dotfiles/
cp -ru ~/.bash_profile ~/dotfiles/
cp -ru ~/.env_vars     ~/dotfiles/
cp -ru ~/.local/bin    ~/dotfiles/.local/
cp -ru ~/.config/tmux  ~/dotfiles/.config/
cp -ru ~/.config/zsh   ~/dotfiles/.config/
cp -ru ~/.config/hypr  ~/dotfiles/.config/
cp -ru ~/.config/mako  ~/dotfiles/.config/
cp -ru ~/.config/nvim  ~/dotfiles/.config/
cp -ru ~/.config/rofi  ~/dotfiles/.config/
cp -ru ~/.config/kitty ~/dotfiles/.config/
```

### Apply

``` bash
cd ~/dotfiles
stow .
```




