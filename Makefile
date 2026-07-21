.PHONY: *

all: gnome-theme gnome-bindings root-dotfiles git gcm nvim fonts wezterm vivid zsh ohmyzsh hypr brave syncthing

# ----------------------------------------- #
# Gnome settings
# ----------------------------------------- #

gnome-theme:
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

gnome-bindings:
	gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
	gsettings set org.gnome.mutter dynamic-workspaces false
	gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
	for i in {1..9}; do \
		gsettings set org.gnome.shell.keybindings switch-to-application-$$i "[]"; \
		gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$$i "['<Super>$$i']"; \
		gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$$i "['<Super><Shift>$$i']"; \
	done
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"

# ----------------------------------------- #
# General
# ----------------------------------------- #

root-dotfiles:
	sudo dnf install -y stow
	mkdir -p ~/.config
	stow -t ~ _root.stpkg

git:
	$(MAKE) -C git

gcm:
	$(MAKE) -C gcm

nvim:
	$(MAKE) -C nvim

# ----------------------------------------- #
# Terminal & Shell
# ----------------------------------------- #

fonts:
	$(MAKE) -C fonts

wezterm:
	$(MAKE) -C wezterm

vivid:
	$(MAKE) -C vivid

zsh: root-dotfiles vivid
	$(MAKE) -C zsh

ohmyzsh: zsh
	$(MAKE) -C ohmyzsh

# ----------------------------------------- #
# Hyprland
# ----------------------------------------- #

hypr:
	$(MAKE) -C hypr

# ----------------------------------------- #
# Applications
# ----------------------------------------- #

brave:
	$(MAKE) -C brave

syncthing:
	$(MAKE) -C syncthing

