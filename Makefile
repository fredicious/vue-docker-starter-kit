.DEFAULT_GOAL:=build

IMAGE_NAME="frontend-docker-starter-kit"
BUILD_FOLDER="${dist}"

test:
	docker build --target setup-stage -t ${IMAGE_NAME}:test .
	docker run --rm ${IMAGE_NAME}:test npm run test

build:
	rm -rf ${BUILD_FOLDER} && mkdir ${BUILD_FOLDER}
	docker build --target build-stage -t ${IMAGE_NAME}:build .
	docker rm ${IMAGE_NAME}-build || true
	docker create -ti --rm --name ${IMAGE_NAME}-build ${IMAGE_NAME}:build bash
	docker cp ${IMAGE_NAME}-build:/app/${BUILD_FOLDER}/. ${PWD}/${BUILD_FOLDER}

deploy:
	echo "your deploy command here"

serve:
	docker build -f Dockerfile-local -t ${IMAGE_NAME}:local .
	docker run --publish 8080:8080 -v ${PWD}:/app -v /app/node_modules ${IMAGE_NAME}:local

clean:
	docker rm -f ${IMAGE_NAME}-build || true
	docker image rm -f ${IMAGE_NAME}:build ${IMAGE_NAME}:test ${IMAGE_NAME}

