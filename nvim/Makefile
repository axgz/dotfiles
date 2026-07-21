.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config nvim.stpkg

install:
	sudo dnf copr enable -y dejan/lazygit
	sudo dnf install -y lazygit nvim fzf

