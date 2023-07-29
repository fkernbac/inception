### VARIABLES ###
NAME	:=	inception
LOGIN	:=	fkernbac

COMPOSE		=	./srcs/docker-compose.yml

SUDO		=	sudo

MAKE_DIR	=	$(SUDO) mkdir -m 777 -p

CHMOD		=	$(SUDO) chmod -R 777

CHOWN		=	$(SUDO) chown -R $(LOGIN)

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
	$(SUDO) rm -rf $(WP_VOLUME)
	$(SUDO) rm -rf $(DB_VOLUME)

fclean: clean
	docker system prune -a
	docker image prune

re: fclean all

### PHONY ###

.PHONY: all clean fclean re start build stop run info
