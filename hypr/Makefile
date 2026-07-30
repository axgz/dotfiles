.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config hypr.stpkg

menus:
	sudo dnf install -y NetworkManager nmcli bluez swaync libnotify

wallpaper:
	sudo dnf install -y ImageMagick
	magick -size 1x1 xc:#000000 ~/Pictures/solid-black.png

install: wallpaper menus
	sudo dnf copr enable -y lionheartp/Hyprland
	sudo dnf install -y hyprland hyprlauncher hyprshutdown hyprlock hypridle

