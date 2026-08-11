.PHONY: *

MODEL_USER := bartowski
MODEL_REPO := Qwen2.5-Coder-14B-Instruct-GGUF
MODEL_NAME := Qwen2.5-Coder-14B-Instruct
MODEL_QANT := Q4_K_M

all: stow build install model start

stow:
	# sudo stow --adopt -t /etc/systemd/system/ llama.stpgk
	sudo cp llama-server.service /etc/systemd/system/

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
	sudo mkdir -p /opt/llama
	sudo cp -r $$HOME/repos/llama.cpp/build/bin /opt/llama/
	echo 'export PATH="/opt/llama/bin:$$PATH"' | sudo tee /etc/profile.d/llama.sh; \
	. /etc/profile.d/llama.sh

model:
	sudo mkdir -p /var/lib/llama/models
	@if [ ! -f /var/lib/llama/models/${MODEL_NAME}-${MODEL_QANT}.gguf ]; then \
		echo "downloading ${MODEL_NAME}-${MODEL_QANT}.gguf"
		# sudo -u llama curl -C -L -O --output-dir /var/lib/llama/models/ "https://huggingface.co/${MODEL_USER}/${MODEL_REPO}/resolve/main/${MODEL_NAME}-${MODEL_QANT}.gguf"
	fi
	sudo ln -s /var/lib/llama/models/${MODEL_NAME}-${MODEL_QANT}.gguf /var/lib/llama/models/default.gguf

start:
	-sudo useradd -m llama
	echo "llama:$$(openssl rand -base64 32)" | sudo chpasswd
	sudo chown -R llama:llama /opt/llama
	sudo chown -R llama:llama /var/lib/llama
	sudo systemctl daemon-reload
	sudo systemctl enable llama-server
	sudo systemctl start llama-server
	ps -u llama -f

