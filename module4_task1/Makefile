.PHONY: build clean post check stop unit-tests integration-tests test lint package

# Variables
BINARY_NAME := awesome-api
LOG_FILE := $(BINARY_NAME).log
PID_FILE := $(BINARY_NAME).pid
DOCKER_IMAGE_NAME := awesome:build

check: ## “Check” should fail when one of the 2 following steps fails: Lint of the Markdown source files using the command line “markdownlint-cli”v0.26.0, Analysis of the links with the command line “markdown-link-check”v3.8.6
	markdownlint content/posts/*.md
	markdown-link-check content/posts/*.md

validate: ## Validate the file ./dist/index.html with W3C validator
	-python3 opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

lint_golang: ## LINT LINT LINT YEAHHHH BABYYYY
	docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE_NAME) golangci-lint run

lint: ## LINT MD
	npm install -g markdownlint-cli
	-markdownlint *.md

go-build:
	docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE_NAME) bash -c "go get github.com/gorilla/mux && go build -o $(BINARY_NAME)"

hugo-build:
	docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE_NAME) hugo

build-docker: ## Build Docker image for development environment
	docker build -f .build/Dockerfile -t $(DOCKER_IMAGE_NAME) module4_task1/

build: hugo-build go-build ## Generate the website from the markdown and configuration files in the directory dist/

unit-tests: ## UNIT TEST UNIT TEST
	docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE_NAME) go test -v -short -coverprofile=coverage-units.out

integration-tests: ## " - integration-tests: Runs the Golang integration tests"
	docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE_NAME) go test -v -coverprofile=coverage-integrations.out

test: unit-tests integration-tests validate ## WOOOHOOOOOOOO saljdfasldhfaksdf asdsafgasgasfasdf

run: ## dslfjsaldjflkdsajfsajf;ljsadjf;lsajdfkldsaf sadfasdfasdfdsa
	./$(BINARY_NAME) > $(LOG_FILE) 2>&1 & echo $$! > $(PID_FILE)

stop: ## dsakjhfalsd hf;lsa fjdsahf;sahfhsadlkfhsadfsafd 
	@if [ -f $(PID_FILE) ]; then kill `cat $(PID_FILE)` && rm $(PID_FILE); fi

clean: ## Cleanup the content of the directory dist/
	-rm -rf dist/
	-make stop
	-rm -f ./awesome-api ./awesome-api.log coverage*
	-rm -f ./awesome-website.zip

post: ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	@if [ -z "$(POST_NAME)" ]; then \
		echo "Error: POST_NAME environment variable is not set."; \
		exit 1; \
	fi
	@if [ -z "$(POST_TITLE)" ]; then \
		echo "Error: POST_TITLE environment variable is not set."; \
		exit 1; \
	fi
	hugo new posts/$(POST_NAME).md
	echo "---\ntitle: \"$(POST_TITLE)\"\ndate: `date -Iseconds`\ndraft: true\n---\n" > content/posts/$(POST_NAME).md

help: ## Prints out the list of targets and their usage
	@awk 'BEGIN {FS = ":.*?# "} /^[a-zA-Z_-]+:.*?# / {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

package:
	zip awesome-website.zip awesome-api dist/
