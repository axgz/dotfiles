.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config wezterm.stpkg

install:
	sudo dnf copr enable -y wezfurlong/wezterm-nightly
	sudo dnf install -y wezterm fzf

