IMG_NAME = keewebwebdav
IMG = repo.treescale.com/euromahadmin/$(IMG_NAME)
TAG = "latest"

.PHONY: build-image
build-image:
	docker build -t $(IMG_NAME) -f ./Dockerfile .

.PHONY: push-image
push-image:
	docker tag $(IMG_NAME) $(IMG):$(TAG)
	docker push $(IMG):$(TAG)

.PHONY: build
build: build-image push-image

.PHONY: build-prd
build-prd: build-image push-image
	docker tag $(IMG_NAME) $(IMG):current
	docker push $(IMG):current

.PHONY: clean
clean:
	rm -f $(APP_NAME)
