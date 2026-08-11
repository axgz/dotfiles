.PHONY: *

all: stow build install start

stow:
	sudo stow --adopt -t /etc/systemd/system/ llama.stpgk

build:
	sudo dnf group install -y development-tools c-development
	mkdir -p "$$HOME/repos"; \
	pushd "$$HOME/repos"; \
	-git clone https://github.com/ggml-org/llama.cpp 2>/dev/null; \
	pushd llama.cpp && git fetch && git pull; \
	cmake -B build -DGGML_NATIVE=ON; \
	cmake --build build --config Release -j$$(nproc); \
	popd; \
	popd

install:
	sudo mkdir -p /opt/llama.cpp/bin
	sudo mkdir -p /var/lib/llama/models
	sudo mkdir -p /etc/llama.cpp
	pushd "$$HOME/repos/llama.cpp"; \
	sudo cp build/bin/llama-server /opt/llama.cpp/bin/; \
	sudo cp build/bin/llama-cli /opt/llama.cpp/bin/; \
	sudo cp build/bin/llama-bench /opt/llama.cpp/bin/; \
	popd
	sudo chmod +x /opt/llama.cpp/bin/*
	echo 'export PATH="/opt/llama.cpp/bin:$$PATH"' | sudo tee /etc/profile.d/llama-cpp.sh; \
	. /etc/profile.d/llama-cpp.sh

start:
	-sudo useradd -m llama
	echo "llama:$$(openssl rand -base64 32)" | sudo chpasswd
	sudo chown -R llama:llama /var/lib/llama
	sudo chmod 755 /opt/llama.cpp/bin/llama-server
	sudo systemctl daemon-reload
	sudo systemctl enable llama-server
	sudo systemctl start llama-server
	sudo systemctl status llama-server
	ps -u llama -f

