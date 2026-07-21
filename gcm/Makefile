.PHONY: *

all: install config

install:
	sudo dnf install -y curl gnome-keyring libsecret-devel secret-tool
	curl -Lo ~/Downloads/gcm.tar.gz https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.tar.gz
	sudo tar -xvf ~/Downloads/gcm.tar.gz -C /usr/local/bin

config:
	git-credential-manager configure
	git config --global credential.credentialStore secretservice

