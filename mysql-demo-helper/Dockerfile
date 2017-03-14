FROM debian:latest

MAINTAINER MDN Developer <dev-mdn@lists.mozilla.org>
WORKDIR /mdn
COPY load-mdn-db.sh /load-mdn-db.sh
RUN apt update && apt install -y python python-pip wget mysql-client jq
RUN pip install urlwait
CMD ["/bin/bash","/load-mdn-db.sh"]

