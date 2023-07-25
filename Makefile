### VARIABLES ###
NAME		:=	inception

### RULES ###

all: $(NAME)

$(NAME): run

run:
	cd src
	build
	docker-compose up

build:
	docker-compose build

### CLEAN UP ###

clean:
	rm -rf $(OBJDIR)

fclean: clean
	sudo rm -rf /home/$(LOGIN)/data/mariadb
	sudo rm -rf /home/$(LOGIN)/data/wordpress

re: fclean all

### PHONY ###

.PHONY: all clean fclean re
