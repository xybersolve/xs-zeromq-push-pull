.PHONY: build up run clean archive

include env.mk
include info.mk

build: clean ## Build requestor & responder images
	${INFO} "Docker Compose build of $(PROJECT)..."
	@docker-compose -p $(PROJECT) build

run: ## Run requestor & responder in live mode
	${INFO} "Docker Compose inline run of $(PROJECT)..."
	@docker-compose -p $(PROJECT) up

down: ## Clean up requestor & responder
	${INFO} "Docker Compose down for $(PROJECT)..."
	@docker-compose -p $(PROJECT) down || true

clean: down
	${INFO} "Docker Compose cleanup (rm -f) for $(PROJECT)..."
	@docker-compose -p $(PROJECT) rm -f || true
