CWD		= `pwd`

pandoc:
	docker build -t nicolasvion/pandoc containers/pandoc
pandoc-force:
	docker build --no-cache=true -t nicolasvion/pandoc containers/pandoc
mermaid:
	docker build -t nicolasvion/mermaid containers/mermaid
mermaid-force:
	docker build --no-cache=true -t nicolasvion/mermaid containers/mermaid
csvtomd:
	docker build -t nicolasvion/csvtomd containers/csvtomd
csvtomd-force:
	docker build --no-cache=true -t nicolasvion/csvtomd containers/csvtomd

%::
	sh ./scripts/run_docker.sh "$@"

lint::
	docker run --rm \
	-v ${CWD}/src:/srv/src                            \
	--workdir /srv                                    \
	mivok/markdownlint:0.4.0 -r ~MD024,~MD025 .
