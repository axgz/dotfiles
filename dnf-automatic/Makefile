.PHONY: *

all: stow install

stow:
	sudo stow --adopt -t /etc/dnf/ dnf-automatic.stpkg

install:
	sudo dnf install -y dnf-automatic
	sudo systemctl enable --now dnf-automatic.timer

