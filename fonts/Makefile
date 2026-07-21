NF := CommitMono
VE := 3.4.0

.PHONY: *

all: install

install:
	sudo dnf install -y curl unzip
	curl -Lo ~/Downloads/${NF}.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v${VE}/${NF}.zip
	mkdir -p ~/.local/share/fonts
	unzip ~/Downloads/${NF}.zip -d ~/.local/share/fonts/${NF} && fc-cache -fv
	fc-list | grep ${NF}

