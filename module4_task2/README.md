## Prerequisites
- Go 1.16 or later
- Gorilla Mux library (install with `go get github.com/gorilla/mux`)

## Lifecycle

This project can be built, run, tested, and cleaned using the following commands:

- `make build`: compile the source code of the application to a binary named `awesome-api`
- `make run`: run the application in the background, and write logs into a file named `awesome-api.log`
- `make stop`: stop the application
- `make clean`: stop the application, delete the binary `awesome-api` and the log file `awesome-api.log`
- `make test`: test the application by sending HTTP requests to `localhost:9999`
- `make lint`: Lint the main
- `make unit-tests`: Makes unit tests
- `integration-tests`: Runs the Golang integration tests
- `make check`: Lint style and verify links in posts/*.md
- `make validate`: Validate W3C style using validator
- `make build-docker`: Build docker image
- `make docker-tests`: Test docker image

To see the full list of available commands, you can run the `make help` command. 
