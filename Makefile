
.PHONY: build
build:
	docker build -t dgzlopes/liftbridge-docker:v0.0.2 . --no-cache

.PHONY: publish
publish:
	docker login
	docker push dgzlopes/liftbridge-docker:v0.0.2

.PHONY: run
run:
	docker run -d -p 4222:4222 -p 9292:9292 -p 8222:8222 -p 6222:6222 dgzlopes/liftbridge-docker:v0.0.2

.PHONY: interative
interative:
	docker run -it -p 4222:4222 -p 9292:9292 -p 8222:8222 -p 6222:6222 dgzlopes/liftbridge-docker:v0.0.2 /bin/ash