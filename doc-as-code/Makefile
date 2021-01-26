CWD		= `pwd`
PREFIX = nicolasvion
IMAGE_PANDOC = pandoc
IMAGE_DIAGRAMS = diagrams
TAG = v0.1

diagrams:
	docker build -t $(PREFIX)/$(IMAGE_DIAGRAMS):$(TAG) containers/diagrams

pandoc:
	docker build -t $(PREFIX)/$(IMAGE_PANDOC):$(TAG) containers/pandoc

%::
	BUILD_ENABLED="yes" sh ./scripts/run_docker.sh "$@"

lint::
	docker run --rm \
	-v ${CWD}/src:/srv/src                            \
	--workdir /srv                                    \
	mivok/markdownlint:0.4.0 -r ~MD024,~MD025 .
