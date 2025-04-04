.PHONY: run_script all up down stop start

# Ensure that 'run_script' is part of the 'all' target if you want it to be triggered
all: run_script up
	@echo "all target executed"

run_script:
	./penultimate.sh

up:
	@echo "up target executed"
	@docker compose -f docker-compose.yml up --build -d

down:
	@docker compose -f docker-compose.yml down

stop:
	@docker compose -f docker-compose.yml stop

start:
	@docker compose -f docker-compose.yml start
