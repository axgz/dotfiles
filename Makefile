NF := CommitMono
VE := 3.4.0

theme:
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

packages:
	sudo dnf install -y zsh curl wget stow tmux nvim bat
	sudo dnf install -y hyprland kitty mako rofi
	sudo dnf install -y --releasever=41 hypridle hyprlock hyprpaper hyprpicker

git:
	git config --global user.name axgz
	git config --global user.email axgz

gcm:
	curl -Lo ~/Downloads/gcm.tar.gz https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.tar.gz
	sudo tar -xvf ~/Downloads/gcm.tar.gz -C /usr/local/bin
	git-credential-manager configure
	git config --global credential.credentialStore secretservice

vivid:
	sudo dnf copr enable -y skoved/vivid
	sudo dnf install -y vivid

lazygit:
	sudo dnf copr enable -y dejan/lazygit
	sudo dnf install -y lazygit

nerdfonts:
	curl -Lo ~/Downloads/${NF}.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v${VE}/${NF}.zip
	mkdir -p ~/.local/share/fonts
	unzip ~/Downloads/${NF}.zip -d ~/.local/share/fonts/${NF} && fc-cache -fv
	fc-list | grep ${NF}

zsh:
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	sudo chsh -s /bin/zsh
	mkdir -p ~/.oh-my-zsh/plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

tpm:
	mkdir -p ~/.config/tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

config: packages git gcm vivid lazygit nerdfonts zsh tpm
	mv ~/.zshrc ~/.zshrc.backup
	stow .

