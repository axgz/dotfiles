.PHONY: *

all: stow install

stow:
	stow --adopt -t ~/.config zsh.stpkg

install:
	sudo dnf install -y zsh
	sudo chsh -s /bin/zsh $$USER

