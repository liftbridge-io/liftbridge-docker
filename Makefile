
.PHONY: build
build:
	docker build -t liftbridge/liftbridge-docker:v0.0.4 -t liftbridge/liftbridge-docker:latest . --no-cache

.PHONY: publish
publish:
	docker login
	docker push liftbridge/liftbridge-docker:v0.0.4
	docker push liftbridge/liftbridge-docker:latest

.PHONY: run
run:
	docker run -d -p 4222:4222 -p 9292:9292 -p 8222:8222 -p 6222:6222 liftbridge/liftbridge-docker

.PHONY: interactive
interactive:
	docker run -it -p 4222:4222 -p 9292:9292 -p 8222:8222 -p 6222:6222 liftbridge/liftbridge-docker /bin/ash
