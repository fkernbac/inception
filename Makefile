### VARIABLES ###
NAME	:=	inception
LOGIN	:= fkernbac

### RULES ###

all: $(NAME)

$(NAME): run

run:
	cd src
	build
	docker-compose up

build:
	docker-compose build

stop:
	docker-compose down

### CLEAN UP ###

clean:
	cd src
	docker-compose down

fclean: clean
	sudo rm -rf /home/$(LOGIN)/data/mariadb
	sudo rm -rf /home/$(LOGIN)/data/wordpress

re: fclean all

### PHONY ###

.PHONY: all clean fclean re
