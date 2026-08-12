.PHONY: *

LLAMA_PORT := 8089

MODEL_USER := bartowski
MODEL_REPO := Qwen2.5-Coder-7B-Instruct-GGUF
MODEL_NAME := Qwen2.5-Coder-7B-Instruct
MODEL_QANT := Q4_K_M

all: build install model user perms service

clean: clean-build clean-install clean-user clean-service

clean-build:
	rm -rf $$HOME/repos/llama.cpp/build

build: clean-build
	sudo dnf group install -y development-tools c-development
	mkdir -p "$$HOME/repos"; \
	pushd "$$HOME/repos"; \
	-git clone https://github.com/ggml-org/llama.cpp 2>/dev/null; \
	pushd llama.cpp && git fetch && git pull; \
	cmake -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/opt/llama.cpp \
		-DBUILD_SHARED_LIBS=OFF; \
	cmake --build build --config Release -j$$(nproc); \
	popd; \
	popd

clean-install:
	-sudo rm -rf /opt/llama.cpp

install: clean-install
	pushd $$HOME/repos/llama.cpp; \
	sudo cmake --install build; \
	popd

model:
	sudo mkdir -p /var/lib/llama/models
	@if [ ! -f /var/lib/llama/models/${MODEL_NAME}-${MODEL_QANT}.gguf ]; then \
		echo "downloading ${MODEL_NAME}-${MODEL_QANT}.gguf"; \
		sudo -u llama curl -L -O --output-dir /var/lib/llama/models/ "https://huggingface.co/${MODEL_USER}/${MODEL_REPO}/resolve/main/${MODEL_NAME}-${MODEL_QANT}.gguf"; \
	else \
		echo "skipping, model ${MODEL_NAME}-${MODEL_QANT}.gguf already exists"; \
	fi

clean-user:
	-sudo userdel -r llama

user: clean-user
	-sudo useradd --system --no-create-home --shell /usr/sbin/nologin llama
	# echo "llama:$$(openssl rand -base64 32)" | sudo chpasswd
	id llama

perms:
	sudo chown -R llama:llama /opt/llama.cpp
	sudo chown -R llama:llama /var/lib/llama

clean-service:
	-sudo systemctl stop llama-server
	-sudo systemctl disable llama-server
	-sudo rm /etc/systemd/system/llama-server.service
	-sudo systemctl daemon-reload

service: clean-service perms
	sudo cp llama-server.service /etc/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl enable llama-server
	sudo systemctl start llama-server
	ps -u llama -f

firewall:
	sudo firewall-cmd --permanent --add-port=${LLAMA_PORT}/tcp
	sudo firewall-cmd --reload

validate:
	curl http://localhost:${LLAMA_PORT}/completion -H "Content-Type: application/json" -d '{ "prompt": "Hello, are you working?", "n_predict": 20}'

