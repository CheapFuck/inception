.PHONY: run_script all up down stop start

# Ensure that 'run_script' is part of the 'all' target if you want it to be triggered
all: run_script up
	@echo "all target executed"

run_script:
	@./srcs/penultimate.sh

up:
	@echo "up target executed"
	@COMPOSE_BAKE=true docker compose -f srcs/docker-compose.yml up --build -d

down:
	@COMPOSE_BAKE=true docker compose -f srcs/docker-compose.yml down

stop:
	@COMPOSE_BAKE=true docker compose -f srcs/docker-compose.yml stop

start:
	@COMPOSE_BAKE=true docker compose -f srcs/docker-compose.yml start
