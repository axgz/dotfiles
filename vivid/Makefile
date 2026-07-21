.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config vivid.stpkg

install:
	sudo dnf copr enable -y skoved/vivid
	sudo dnf install -y vivid

