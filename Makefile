YML_FILE = ./src/docker-compose.yml

OPT = -f $(YML_FILE)

all: up

up: 
	docker compose $(OPT) up --build

down:
	docker compose $(OPT) down

clean:
	echo 1 || ./clean.sh
	docker compose $(OPT) rm -f

ps:
	docker compose $(OPT) ps

re: down clean up

.PHONY: up down ps

