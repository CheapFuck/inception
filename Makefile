.PHONY: run_script all up down stop start create_dirs

DIRS := $(HOME)/data/peercoin $(HOME)/data/mariadb
USER_NAME=$(shell whoami)

all: create_dirs update-yml run_script up
	@echo "all target executed"

create_dirs:
	@for dir in $(DIRS); do \
		if [ ! -d $$dir ]; then \
			echo "Creating directory $$dir"; \
			sudo mkdir -p $$dir; \
		else \
			echo "Directory $$dir already exists"; \
		fi \
	done

run_script:
	./srcs/penultimate.sh

update-yml:
	@echo "Updating YML file with current username..."
	@sed -i "s|/home/___USERNAME___|/home/$(USER_NAME)|g" srcs/docker-compose.yml
	@echo "YML file updated successfully!"

up:
	@echo "up target executed"
	@docker compose -f srcs/docker-compose.yml up --build -d

down:
	@docker compose -f srcs/docker-compose.yml down

stop:
	@docker compose -f srcs/docker-compose.yml stop

start:
	@docker compose -f srcs/docker-compose.yml start
