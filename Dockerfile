FROM ubuntu
# Install Packer
RUN apt-get update
RUN apt-get install curl -y
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install packer -y
# Install Ansible
RUN apt-get install software-properties-common -y
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get install ansible -y
# Copy Entrypoint
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]