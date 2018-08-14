FROM centos:centos7
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip
RUN mkdir -p /etc/ansible /ansible/ansible-roles /ansible/logs
RUN pip install ansible
COPY config/ansible.cfg /etc/ansible/
COPY config/hosts /etc/ansible/ 
