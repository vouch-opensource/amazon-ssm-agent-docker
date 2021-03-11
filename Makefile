IMAGE = vouchio/amazon-ssm-agent
VERSION = $(shell docker run -it ${IMAGE} amazon-ssm-agent --version | awk '{ print $$4 }')

build:
	docker build --no-cache -t ${IMAGE} .

tag:
	docker tag ${IMAGE} ${IMAGE}:${VERSION}
	docker tag ${IMAGE} ${IMAGE}:latest

build-version: build tag

push: build-version
	docker push ${IMAGE}:${VERSION}
	docker push ${IMAGE}:latest
