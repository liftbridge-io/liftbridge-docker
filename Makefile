
.PHONY: build
build:
	docker build -t dgzlopes/liftbridge-docker:v0.0.1 . --no-cache

.PHONY: publish
publish:
	docker login
	docker push dgzlopes/liftbridge-docker:v0.0.1

.PHONY: run
run:
	docker run -d -p 4222:4222 -p 9292:9292 -p 8222:8222 dgzlopes/liftbridge-docker:v0.0.1

.PHONY: interative
interative:
	docker run -it dgzlopes/liftbridge-docker:v0.0.1 /bin/ash