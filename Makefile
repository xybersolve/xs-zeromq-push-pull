.PHONY: build up run clean archive

include env.mk

build: clean ## Build requestor & responder images
	@docker-compose -p $(PROJECT) build

run: ## Run requestor & responder in live mode
	@docker-compose -p $(PROJECT) up

down: ## Clean up requestor & responder
	@docker-compose -p $(PROJECT) down || true

clean: down
	@docker-compose -p $(PROJECT) rm -f || true
