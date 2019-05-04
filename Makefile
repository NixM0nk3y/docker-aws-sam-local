CMD := docker run -it --rm \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v "$(pwd -P)/example":/var/opt \
	-p "3000:3000" \
	openenterprise/aws-sam-local

help:
	@$(CMD) --version

validate:
	@$(CMD) validate

local-generate-event:
	@$(CMD) local generate-event api > ./example/event.json

local-invoke: gen-event
	@$(CMD) local invoke -e event.json --docker-volume-basedir "$(pwd -P)/example"

local-start-api:
	@$(CMD) local start-api --docker-volume-basedir "$(pwd -P)/example" --host 0.0.0.0

build:
	docker build -t openenterprise/aws-sam-local .
