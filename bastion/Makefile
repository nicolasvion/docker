PREFIX = nicolasvion
IMAGE = bastion
TAG = v0.1

build:
	docker build --no-cache -t $(PREFIX)/$(IMAGE):$(TAG) .

push:
	docker push $(PREFIX)/$(IMAGE):$(TAG)
