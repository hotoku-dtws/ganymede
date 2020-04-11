image: Dockerfile
	docker build -t hotokudtws/ganymede .

push: image
	docker push hotokudtws/ganymede:latest
