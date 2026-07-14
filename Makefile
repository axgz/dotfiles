NF := CommitMono
VE := 3.4.0

.PHONY: basics git gcm dotfiles theme fonts vivid wezterm zsh ohmyzsh ohmyzsh-plugins

# ----------------------------------------- #
# General
# ----------------------------------------- #

basics:
	sudo dnf install -y curl wget bat

git:
	git config --global user.name axgz
	git config --global user.email axgz@local
	git config --global core.pager cat

gcm: basics
	curl -Lo ~/Downloads/gcm.tar.gz https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.tar.gz
	sudo tar -xvf ~/Downloads/gcm.tar.gz -C /usr/local/bin
	git-credential-manager configure
	git config --global credential.credentialStore secretservice

dotfiles:
	sudo dnf install -y stow
	mkdir -p ~/.config
	stow -t ~ root.stpkg

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
# Terminal & Shell
# ----------------------------------------- #

fonts: basics
	curl -Lo ~/Downloads/${NF}.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v${VE}/${NF}.zip
	mkdir -p ~/.local/share/fonts
	unzip ~/Downloads/${NF}.zip -d ~/.local/share/fonts/${NF} && fc-cache -fv
	fc-list | grep ${NF}

vivid: dotfiles
	stow --adopt -t ~/.config vivid.stpkg
	sudo dnf copr enable -y skoved/vivid
	sudo dnf install -y vivid

wezterm: dotfiles
	stow --adopt -t ~/.config wezterm.stpkg
	sudo dnf copr enable -y wezfurlong/wezterm-nightly
	sudo dnf install -y wezterm fzf

zsh: vivid
	stow --adopt -t ~/.config zsh.stpkg
	sudo dnf install -y zsh
	sudo chsh -s /bin/zsh

ohmyzsh: zsh
	-git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh 2>/dev/null
	pushd ~/.oh-my-zsh && git fetch && git pull && popd
	mkdir -p ~/.oh-my-zsh/plugins
	-git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting 2>/dev/null
	pushd ~/.oh-my-zsh/plugins/zsh-syntax-highlighting && git fetch && git pull && popd
	-git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions 2>/dev/null
	pushd ~/.oh-my-zsh/plugins/zsh-autosuggestions && git fetch && git pull && popd

# ----------------------------------------- #
# Hyprland
# ----------------------------------------- #

hypr:
	sudo dnf install -y hyprland kitty mako rofi
	sudo dnf install -y --releasever=41 hypridle hyprlock hyprpaper hyprpicker

# ----------------------------------------- #
# Applications
# ----------------------------------------- #

brave:
	curl -fsS https://dl.brave.com/install.sh | sh

nvim: dotfiles
	stow --adopt -t ~/.config nvim.stpkg
	sudo dnf copr enable -y dejan/lazygit
	sudo dnf install -y lazygit nvim fzf

syncthing:
	sudo dnf install -y syncthing
	systemctl --user enable syncthing.service
	systemctl --user start syncthing.service
	@echo connect using http://localhost:8384

syncthing-server:
	# Use these commands on the headless server
	sudo dnf install -y syncthing
	sudo systemctl enable syncthing@$SUDO_USER.service
	sudo systemctl start syncthing@$SUDO_USER.service

syncthing-connect-server:
	@echo -n "Enter server IP address: "; \
	read -r SERVER_IP; \
	@echo Connect using http://localhost:9394
	ssh -L 9394:127.0.0.1:8384 $$USER@$$SERVER_IP

