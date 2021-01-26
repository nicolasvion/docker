CWD		= `pwd`
PREFIX = nicolasvion
IMAGE = pandoc
TAG = v0.1

pandoc:
	docker build -t $(PREFIX)/$(IMAGE):$(TAG) containers/pandoc

%::
	BUILD_ENABLED="yes" sh ./scripts/run_docker.sh "$@"

lint::
	docker run --rm \
	-v ${CWD}/src:/srv/src                            \
	--workdir /srv                                    \
	mivok/markdownlint:0.4.0 -r ~MD024,~MD025 .
