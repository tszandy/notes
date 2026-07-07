SERVICES := data-template-manager data-manager execution-manager agents-interaction-manager evaluation-manager report-manager

# Container name prefix (override with: make NAME_PREFIX=myapp ...)
export NAME_PREFIX ?= catf

# Auto-detect host user UID/GID for Docker volume permissions
export USER_UID := $(shell id -u)
export USER_GID := $(shell id -g)

# Project path (used by services for workspace creation)
export PROJECT_PATH := $(CURDIR)

# Logging: create logs dir and tee output to timestamped log files
LOG_DIR := ./logs
$(shell mkdir -p $(LOG_DIR))
TIMESTAMP := $(shell date +%Y%m%d_%H_%M_%S)
define LOG
2>&1 | tee -a $(LOG_DIR)/$(TIMESTAMP)_$(1).log
endef

.PHONY: dev dev-build prod test test-unit test-integration test-integration-dev test-integration-prod lint migrate clean help bash-dev debug logs status down attach fmt db_dump archive_logs seeddata

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

dev: ## Start services in dev mode with :dev tag (usage: make dev or make dev SVC=dtm)
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d $(SVC) $(call LOG,dev)

dev-build: ## Start services in dev mode with :dev tag (usage: make dev or make dev SVC=dtm)
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d $(SVC) $(call LOG,dev-build)

prod: ## Build and start services in production mode with :latest tag
	docker compose -f docker-compose.yml up --build -d $(SVC) $(call LOG,prod)

test: test-unit ## Alias for test-unit

test-unit: ## Run all unit tests (backend Go + frontend Vitest)
	( for svc in $(SERVICES); do \
		echo "=== Testing $$svc ==="; \
		cd services/$$svc && go test ./... && cd ../..; \
	done; \
	echo "=== Testing pkg ==="; \
	cd pkg && go test ./... && cd ..; \
	echo "=== Testing frontend ==="; \
	cd web && npx vitest run && cd .. ) $(call LOG,test-unit)

test-integration: test-integration-dev ## Alias for test-integration-dev

test-integration-dev: ## Run integration tests against dev containers
	( docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d && \
	docker compose -f docker-compose.yml -f docker-compose.dev.yml --profile debug up --build -d debug && \
	docker exec $(NAME_PREFIX)-debug bash /app/scripts/integration-test.sh ) $(call LOG,test-integration-dev)

test-integration-prod: ## Run integration tests against prod containers
	( docker compose -f docker-compose.yml up --build -d && \
	docker compose -f docker-compose.yml -f docker-compose.dev.yml --profile debug up --build -d debug && \
	docker exec $(NAME_PREFIX)-debug bash /app/scripts/integration-test.sh ) $(call LOG,test-integration-prod)

lint: ## Run golangci-lint across all services
	( for svc in $(SERVICES); do \
		echo "=== Linting $$svc ==="; \
		cd services/$$svc && golangci-lint run ./... && cd ../..; \
	done; \
	echo "=== Linting pkg ==="; \
	cd pkg && golangci-lint run ./... && cd .. ) $(call LOG,lint)

ACTION ?= up
ALL_SVC := dtm dm em aim evm um
migrate: ## Run migrations (usage: make migrate [SVC=dtm] [ACTION=up|down|version])
ifdef SVC
	docker compose exec $(SVC) go run ./cmd/server migrate $(ACTION) && echo "=== $(SVC) migrate $(ACTION) done ===" $(call LOG,migrate)
else
	($(foreach s,$(ALL_SVC),docker compose exec $(s) go run ./cmd/server migrate $(ACTION) && echo "=== $(s) migrate $(ACTION) done ===";)) $(call LOG,migrate)
endif

seeddata: ## Seed all databases with initial data
	docker compose exec postgres psql -U postgres -f /scripts/seed-data.sql $(call LOG,seeddata)

archive_logs: ## Archive log files to ./logs/archive/
	@mkdir -p $(LOG_DIR)/archive
	@mv $(LOG_DIR)/*.log $(LOG_DIR)/archive/ 2>/dev/null || echo "No log files to archive"

bash-dev: ## Start a container with /bin/sh for debugging (usage: make bash-dev SVC=dtm)
	docker compose -f docker-compose.yml -f docker-compose.dev.yml run --build --rm --entrypoint /bin/sh $(SVC)

debug: ## Start a Debian debug container attached to the $(NAME_PREFIX)-network
	docker compose -f docker-compose.yml -f docker-compose.dev.yml --profile debug up -d --build debug $(call LOG,debug) && \
	docker exec -it $(NAME_PREFIX)-debug bash

logs: ## Show logs for a service (usage: make logs SVC=web)
	docker compose -f docker-compose.yml -f docker-compose.dev.yml logs -f $(SVC) $(call LOG,logs_$(SVC))

status: ## Show status of all project containers
	@docker ps -a --filter "name=$(NAME_PREFIX)-" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

down: ## Stop all containers
	docker compose -f docker-compose.yml -f docker-compose.dev.yml down $(SVC) $(call LOG,down)

clean: ## Remove containers, volumes, and images
	docker compose -f docker-compose.yml -f docker-compose.dev.yml down -v --rmi local $(call LOG,clean)

attach: ## Attach to a running container with /bin/sh (usage: make attach SVC=aim)
	docker exec -it $(NAME_PREFIX)-$(SVC) /bin/sh

fmt: ## Format all Go code
	( for svc in $(SERVICES); do \
		cd services/$$svc && gofmt -w . && cd ../..; \
	done; \
	cd pkg && gofmt -w . && cd .. ) $(call LOG,fmt)

DB_SERVICES := dtm:dtm_app:dtm_db dm:dm_app:dm_db em:em_app:em_db aim:aim_app:aim_db evm:evm_app:evm_db um:um_app:um_db

db_dump: ## Dump all service databases to ./logs/ (per-table: schema then records)
	@mkdir -p $(LOG_DIR)
	@for entry in $(DB_SERVICES); do \
		svc=$$(echo $$entry | cut -d: -f1); \
		user=$$(echo $$entry | cut -d: -f2); \
		db=$$(echo $$entry | cut -d: -f3); \
		logfile=$(LOG_DIR)/$(TIMESTAMP)_$${svc}_db_dump.log; \
		echo "=== $$(echo $$svc | tr a-z A-Z) ($$db) ==="; \
		tables=$$(docker exec $(NAME_PREFIX)-postgres psql -U $$user -d $$db -t -c \
			"SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;"); \
		for tbl in $$tables; do \
			echo "== $$tbl ==" >> $$logfile; \
			docker exec $(NAME_PREFIX)-postgres psql -U $$user -d $$db -c "\d $$tbl" >> $$logfile 2>&1; \
			docker exec $(NAME_PREFIX)-postgres psql -U $$user -d $$db -x -c "SELECT * FROM $$tbl;" >> $$logfile 2>&1; \
			echo "" >> $$logfile; \
		done; \
		echo "  ->> $$logfile"; \
	done
	@echo "=== Done. All dumps in $(LOG_DIR)/ ==="
