FROM hashicorp/packer:latest

RUN pip install ansible

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
