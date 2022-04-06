YML_FILE = ./src/docker-compose.yml

OPT = -f $(YML_FILE)

all: build_up

init:
	./tools/init.sh

build_up: 
	docker-compose $(OPT) up --build

up :
	docker-compose $(OPT) up

down:
	docker-compose $(OPT) down

build:
	docker-compose $(OPT) build --no-cache

clean:
	./tools/clean.sh

ps:
	docker-compose $(OPT) ps

re: down clean up

.PHONY: up down ps

