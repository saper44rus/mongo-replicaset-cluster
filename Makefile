.PHONY: up
up:
	docker compose up -d

.PHONY: init
init:
	docker compose exec mongo_node_1 mongosh --eval 'load ("/data/config/init-replica-set.js")' || true
	@echo -e "Wait init replicaSet" && sleep 10
	docker compose exec mongo_node_1 mongosh --eval '"rs.status()"' || true
	docker compose exec mongo_node_1 mongosh --eval 'load ("/data/config/init-user.js")' || true
	docker compose exec mongo_node_1 mongosh mongodb://mdb_admin:mdb_pass@170.17.5.5:27017,170.17.5.6:27017,170.17.5.7:27017/?replicaSet=my_mdb_rs --eval '"rs.status()"'
	@echo -e "Your Connection String:\n'mongosh mongodb://mdb_admin:mdb_pass@170.17.5.5:27017,170.17.5.6:27017,170.17.5.7:27017/?replicaSet=my_mdb_rs'"

.PHONY: down
down:
	docker compose down
