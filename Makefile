### VARIABLES ###
NAME	:=	inception
LOGIN	:=	fkernbac

COMPOSE		=	cd srcs && docker-compose

MAKE_DIR	=	sudo mkdir -m 777 -p

CHMOD		=	sudo chmod -R 777

CHOWN		=	sudo chown -R fkernbac

### RULES ###

all: $(NAME)

$(NAME): start

start:
	sudo mkdir -m 777 -p /home/$(LOGIN)/data/wordpress_data
	sudo mkdir -m 777 -p /home/$(LOGIN)/data/mariadb_data
	sudo chown -R fkernbac:fkernbac "/home/$(LOGIN)/data"
	sudo chmod -R 777 "/home/$(LOGIN)/data"
#	sudo docker network create externalNetwork
	$(COMPOSE) up --build

build:
	docker-compose -f ./srcs/docker-compose.yml build

stop:
#	if docker network rm externalNetworketwork; then echo "No network to remove"; fi
	docker-compose -f ./srcs/docker-compose.yml down

run:
	docker-compose -f ./srcs/docker-compose.yml up

info:
	docker ps -a
	docker images -a

### CLEAN UP ###

clean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	sudo rm -rf /home/$(LOGIN)/data/mariadb_data/*
	sudo rm -rf /home/$(LOGIN)/data/wordpress_data/*

fclean: clean
#	docker stop $$(docker ps -qa)
	docker system prune -a
	docker image prune

re: fclean all

### PHONY ###

.PHONY: all clean fclean re start stop run info
