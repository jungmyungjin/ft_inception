YML_FILE = /Users/jungmyungjin/Workspace/docker/ft_inception/src/docker-compose.yml

OPT = -f $(YML_FILE)

all: up

up: 
	docker compose $(OPT) up --build

down:
	docker compose $(OPT) down

ps:
	docker compose $(OPT) ps

re: down up

.PHONY: up down ps

