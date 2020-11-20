FROM ubuntu
# Install Packer
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN sudo apt-get update && sudo apt-get install packer -y
# Install Ansible
RUN sudo apt install software-properties-common
RUN sudo apt-add-repository --yes --update ppa:ansible/ansible
RUN sudo apt-get install ansible -y
# Copy Entrypoint
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]