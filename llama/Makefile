.PHONY: *

all: install

stow:
	sudo stow --adopt -t ~/.config llama.stpkg

install:
	sudo dnf group install -y development-tools c-development
	mkdir -p "$$HOME/repos"; \
	pushd "$$HOME/repos"; \
	-git clone https://github.com/ggml-org/llama.cpp 2>/dev/null; \
	pushd llama.cpp && git fetch && git pull; \
	cmake -B build -DGGML_NATIVE=ON; \
	cmake --build build --config Release -j$$(nproc); \
	popd; \
	popd

