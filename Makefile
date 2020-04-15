.PHONY: format help

# Help system from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build the Okta container
	@echo "Building new Okta AWSCLI container image as 'okta-awscli'.\n"
	@sleep 1
	docker build -t okta-awscli .
	@echo "\n\nConfirming local Okta environment"
	mkdir -p ~/.okta
	touch ~/.okta/config.properties

show: ## Show the command to run to invoke the tool
	@echo "Setup a shell alias. Stick this into .bashrc to make it persistent."
	@echo "\n  > alias okta-awscli=\"docker run -v ~/.okta/config.properties:/home/okta/.okta/config.properties -v ~/.aws:/home/okta/.aws -it okta-awscli\""
