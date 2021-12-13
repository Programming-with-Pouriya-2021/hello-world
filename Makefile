all: build run ## build and run the code


build: ## build the code
	mkdir -p bin
	gcc src/hello_world.c -o bin/hello-world


run: ## run the code
	./bin/hello-world


clean: ## removes generated directory & files
	rm -rf bin

create_user_list: ## create a text file that contain all of the system user's
	awk -F: '{ print $$1}' /etc/passwd >> bin/user.txt
	@# remove last \n from user.txt file to prevent overprinting Hello in last line
	truncate -s -1 bin/user.txt

hello_everyone: build create_user_list run ## saying hello to all user

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%s: %s\n", $$1, $$2}'

