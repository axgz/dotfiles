.PHONY: *

all: install

stow:
	sudo stow --adopt -t ~/.config llama.stpkg

install:
	mkdir -p "$$HOME/repos"; \
	pushd "$$HOME/repos"; \
	git clone https://github.com/ggml-org/llama.cpp; \
	pushd llama.cpp; \
	cmake -B build -DGGML_NATIVE=ON; \
	cmake --build build --config Release -j$$(nproc); \
	popd; \
	popd

