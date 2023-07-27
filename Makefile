### VARIABLES ###
NAME	:=	inception
LOGIN	:=	fkernbac
COMPOSE	:=	./srcs/docker-compose.yml

### RULES ###

all: $(NAME)

$(NAME): start

start:
	docker-compose -f $(COMPOSE) up --build

stop:
	docker-compose -f $(COMPOSE) down

run:
	docker-compose -f $(COMPOSE) up

info:
	docker ps -a
	docker images -a

### CLEAN UP ###

clean:
	docker-compose -f $(COMPOSE) down --volumes --rmi all
	sudo rm -rf /home/$(LOGIN)/data/mariadb_data/*
	sudo rm -rf /home/$(LOGIN)/data/wordpress_data/*

fclean: clean
#	docker stop $$(docker ps -qa)
	docker system prune -a
	docker image prune

re: fclean all

### PHONY ###

.PHONY: all clean fclean re start stop run info
