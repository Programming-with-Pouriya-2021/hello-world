
all: build run ## build and run the code


build: ## build the code
	mkdir -p bin
	gcc src/hello_world.c -o bin/hello-world


run: ## run the code
	./bin/hello-world


clean: ## removes generated directory & files
	rm -rf bin


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%s: %s\n", $$1, $$2}'
