.PHONY: *

all: install

install: syncthing

syncthing:
	sudo dnf install -y syncthing
	systemctl --user enable syncthing.service
	systemctl --user start syncthing.service
	@echo connect using http://localhost:8384

syncthing-server:
	# Use these commands on the headless server
	sudo dnf install -y syncthing
	sudo systemctl enable syncthing@$$USER.service
	sudo systemctl start syncthing@$$USER.service

syncthing-connect-server:
	@echo -n "Enter server IP address: "; \
	read -r SERVER_IP; \
	@echo Connect using http://localhost:9394
	ssh -L 9394:127.0.0.1:8384 $$USER@$$SERVER_IP

