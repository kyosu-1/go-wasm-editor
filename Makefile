GO := go
GOOS := js
GOARCH := wasm
SOURCE := src/main.go
OUTPUT := web/main.wasm
WASM_EXEC := $(shell go env GOROOT)/misc/wasm/wasm_exec.js

build:
	@echo "Building Go to WebAssembly..."
	GOOS=$(GOOS) GOARCH=$(GOARCH) $(GO) build -o $(OUTPUT) $(SOURCE)
	cp $(WASM_EXEC) web/

clean:
	@echo "Cleaning..."
	rm -f $(OUTPUT)
