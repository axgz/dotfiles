.PHONY: *

all: install

stow:
	sudo stow --adopt -t ~/.config llama.stpkg

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
	source /etc/profile.d/llama-cpp.sh

