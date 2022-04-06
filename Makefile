YML_FILE = ./src/docker-compose.yml

OPT = -f $(YML_FILE)

all: up

build_up: 
	docker-compose $(OPT) up --build

up :
	docker-compose $(OPT) up

down:
	docker-compose $(OPT) down

build:
	docker-compose $(OPT) build --no-cache

clean:
	./clean.sh

ps:
	docker-compose $(OPT) ps

re: down clean up

.PHONY: up down ps

