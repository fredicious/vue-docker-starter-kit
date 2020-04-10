.DEFAULT_GOAL:=build

IMAGE_NAME=fredicious/vue-docker-starter-kit
BUILD_FOLDER="dist"


serve:
	docker build --target setup-stage -t ${IMAGE_NAME}:setup .
	docker run -it --rm -p 8080:8080 -v ${PWD}:/app -v /app/node_modules ${IMAGE_NAME}:setup npm run serve

lint:
	docker build --target setup-stage -t ${IMAGE_NAME}:setup .
	docker run --rm -v ${PWD}/src:/app/src -v ${PWD}/tests:/app/tests ${IMAGE_NAME}:setup npm run lint

test:
	docker build --target setup-stage -t ${IMAGE_NAME}:setup .
	docker run --rm -v ${PWD}/coverage:/app/coverage ${IMAGE_NAME}:setup npm run test:unit

build:
	docker build --target build-stage -t ${IMAGE_NAME}:build .
	docker create --rm --name build-app ${IMAGE_NAME}:build bash
	docker cp build-app:/app/${BUILD_FOLDER}/. ${PWD}/${BUILD_FOLDER}
	docker rm -f build-app

build-server:
	docker build --target production-stage -t ${IMAGE_NAME}:latest .

publish:
	docker login --username=${DOCKER_USERNAME} -p=${DOCKER_PASSWORD}
	docker push ${IMAGE_NAME}:latest

deploy:
	echo "your deploy command here"

clean:
	docker rm -f build-app || true
	docker image rm -f ${IMAGE_NAME}:build ${IMAGE_NAME}:setup ${IMAGE_NAME}

