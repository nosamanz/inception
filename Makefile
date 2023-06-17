DOCKER := docker-compose -f ./srcs/docker-compose.yml
USER_HOME = $(HOME)

all:
	sudo mkdir -p $(USER_HOME)/data/wordpress
	sudo mkdir -p $(USER_HOME)/data/mysql
	export USER_HOME=$$HOME && $(DOCKER) up -d --build

down:
	$(DOCKER) down

re: clean all

clean:
	$(DOCKER) down -v --remove-orphans
	@docker rmi -f $$(docker images -q)
	sudo rm -rf $(USER_HOME)/data/*

fclean: clean

.PHONY: all down re clean
