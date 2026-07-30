.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config waybar.stpkg

cargo:
	echo 'export PATH="$$HOME/.cargo/bin:$$PATH"' >> ~/.exports
	source ~/.exports
	export PATH="$HOME/.cargo/bin:$PATH"
	sudo dnf install -y rust cargo

wifitui: cargo
	cargo install wifitui

bluetui: cargo
	sudo dnf install -y dbus-devel pkgconf-pkg-config
	cargo install bluetui

install: wifitui bluetui
	sudo dnf install -y waybar btop NetworkManager NetworkManager-wifi network-manager-applet swaync

