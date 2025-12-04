build:
	docker build -t subscription-service:latest .

run:
	docker run -p 8080:8080 subscription-service:latest

push:
	docker push subscription-service:latest

stop:
	docker stop $$(docker ps -q --filter ancestor=subscription-service:latest)
