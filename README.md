# vue-docker-starter-kit

A template to start vuejs projects with docker.
The motivation behind this is that the only dependency you need to install is docker, everything else will be installed and run inside containers.
This makes starting new projects faster, it helps onboarding new team-mates, and makes it easy to switch between projects as it gives a consistant way of building and running our apps.


## Vue setup

Vuejs has been setup with my favorite defaults, but you can easily change and adapt the config to your own preference, it shouldn't change anything to the way we dockerize it.

## Make

Makefile gives a simple way to wrap and run the docker commands.
You can change the variable `IMAGE_NAME="vue-docker-starter-kit"` in the `Makefile` if you want to change the name of the docker image.

- `make build` to build the app into the local `./dist` folder
- `make build-server` to build a docker image with nginx serving the static dist files. By default the image will be tagged as `vue-docker-starter-kit:latest`
- `make test` to run all unit tests with code coverage. Results will be in `./coverage/`
- `make serve` to start the local server with hotreload during development. By default it will serve the app at [localhost:8080](http://localhost:8080/)
- `make lint` to run the linter with autofix
- `make clean` to clean up docker containers and images
- `make publish` to push the docker image to the repository
- `make deploy` to deploy the app (nothing is implemented here, it's up to you how you deploy your app, if you are not sure take a look at [zeit.co](https://zeit.co/))

## CI/CD

- take a look at `.github/workflows/` to have some examples on how you could setup a CI/CD Pipeline