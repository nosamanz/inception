DOCKER = docker-compose -f ./srcs/docker-compose.yml

all:
	sudo mkdir -p /home/data/wordpress
	sudo mkdir -p /home/data/mysql
	$(DOCKER) up -d build

down:
	$(DOCKER) down

re: clean all

clean:
# Down ile durdurur ve vagli volumleri kaldirir
	$(DOCKER) down -v --remove-orphans
#Kullanilmayan imajlari siler
	@docker rmi -f $$(docker images -q)

.PHONY: all down re clean
