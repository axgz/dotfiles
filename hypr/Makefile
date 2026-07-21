.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config hypr.stpkg

install:
	sudo dnf copr disable -y solopasha/hyprland
	sudo dnf copr enable -y lionheartp/Hyprland
	sudo dnf install -y hyprland
	# sudo dnf group install -y c-development; \
	# #sudo dnf install ninja-build cmake meson gcc-c++ libxcb-devel libX11-devel pixman-devel wayland-protocols-devel cairo-devel pango-devel
	# pushd ~/repos; \
	# git clone --recursive https://github.com/hyprwm/Hyprland; \
	# pushd Hyprland; \
	# make all && sudo make install; \


	#sudo dnf install -y hyprland mako rofi
	#sudo dnf install -y --releasever=41 hypridle hyprlock hyprpaper hyprpicker

