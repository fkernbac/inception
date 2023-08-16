### VARIABLES ###
NAME	:=	inception
LOGIN	:=	fkernbac

COMPOSE		=	./srcs/docker-compose.yml

MAKE_DIR	=	sudo mkdir -m 644 -p

CHMOD		=	sudo chmod -R 644

CHOWN		=	sudo chown -R $(LOGIN)

DATA		=	/home/$(LOGIN)/data
WP_VOLUME	=	$(DATA)/wordpress_data
DB_VOLUME	=	$(DATA)/mariadb_data

### RULES ###

all: $(NAME)

$(NAME): start

start:
	$(MAKE_DIR) $(WP_VOLUME)
	$(MAKE_DIR) $(DB_VOLUME)
	$(CHOWN) $(DATA)
	$(CHMOD) $(DATA)
	docker-compose -f $(COMPOSE) up --build

build:
	docker-compose -f $(COMPOSE) build

down:
	docker-compose -f $(COMPOSE) down

up:
	docker-compose -f $(COMPOSE) up

info:
	docker ps -a
	docker images -a

### CLEAN UP ###

clean:
	docker-compose -f $(COMPOSE) down --volumes --rmi all
	sudo rm -rf $(WP_VOLUME)
	sudo rm -rf $(DB_VOLUME)

fclean: clean
	docker system prune -a
	docker image prune

re: fclean all

### PHONY ###

.PHONY: all clean fclean re start build stop run info
