build:
	docker build -t nicolasvion/ansible .

run:
	docker run -it --rm --name ansible -v $(CURDIR)/ssh:/root/.ssh -v $(CURDIR)/app:/ansible/ansible-roles nicolasvion/ansible:latest ansible-playbook /ansible/ansible-roles/playbook.yml
