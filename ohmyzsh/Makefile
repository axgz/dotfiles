.PHONY: *

all: install

install:
	-git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh 2>/dev/null
	pushd ~/.oh-my-zsh && git fetch && git pull && popd
	mkdir -p ~/.oh-my-zsh/plugins
	-git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting 2>/dev/null
	pushd ~/.oh-my-zsh/plugins/zsh-syntax-highlighting && git fetch && git pull && popd
	-git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions 2>/dev/null
	pushd ~/.oh-my-zsh/plugins/zsh-autosuggestions && git fetch && git pull && popd

