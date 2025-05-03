.PHONY: run_script all up down stop start create_dirs

# Directories you want to check/create
DIRS := $(HOME)/data/peercoin $(HOME)/data/mariadb

# Ensure that 'run_script' and 'create_dirs' are part of the 'all' target
all: create_dirs run_script up
	@echo "all target executed"

# Target to check and create directories
create_dirs:
	@for dir in $(DIRS); do \
		if [ ! -d $$dir ]; then \
			echo "Creating directory $$dir"; \
			sudo mkdir -p $$dir; \
		else \
			echo "Directory $$dir already exists"; \
		fi \
	done

YML_FILE=srcs/docker-compose.yml

# Get the current username
USER_NAME=$(shell whoami)
# Run your script
run_script:
	./srcs/penultimate.sh

update-yml:
	@echo "Updating YML file with current username..."
	@sed -i "s|/home/___USERNAME___|/home/$(USER_NAME)|g" $(YML_FILE)
	@echo "YML file updated successfully!"

# Docker up (builds and starts containers)
up:
	@echo "up target executed"
	@docker compose -f srcs/docker-compose.yml up --build -d

# Docker down (stops and removes containers)
down:
	@docker compose -f srcs/docker-compose.yml down

# Docker stop (stops containers)
stop:
	@docker compose -f srcs/docker-compose.yml stop

# Docker start (starts containers)
start:
	@docker compose -f srcs/docker-compose.yml start
