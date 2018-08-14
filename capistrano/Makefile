build:
	docker build -t nicolasvion/capistrano:3.5 .
run:
	docker run --rm --name capistrano -v $(CURDIR)/ssh:/root/.ssh -v $(CURDIR):/app nicolasvion/capistrano:3.5 cap --version
