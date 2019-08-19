BUILD=docker build -t iampeterbanjo/hapi .
REBUILD=docker build --no-cache -t iampeterbanjo/hapi .
EXEC=docker exec -it pnpm-app /bin/bash
REMOVE=docker rm pnpm-app
RUN=docker run -d -it -p 8080:8080 --name pnpm-app iampeterbanjo/hapi
START=docker start pnpm-app
STOP=docker stop pnpm-app
LOGS=docker logs pnpm-app

.PHONY: build
build: ## build docker image
	$(BUILD)

.PHONY: exec
exec: # enter the container
	$(EXEC)

.PHONY: logs
logs: # container logs
	$(LOGS)

.PHONY: reload
reload: # stop, rm, build, run
	$(STOP) && $(REMOVE) && $(REBUILD) && $(RUN)

.PHONY: rm
rm: # remove image
	$(REMOVE)

.PHONY: run
run: ## run docker image
	$(RUN)

.PHONY: start
start: # start image
	$(START)

.PHONY: stop
stop: # stop image
	$(STOP)

.PHONY: help
help:
@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
