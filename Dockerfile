FROM lsiobase/alpine:3.14

RUN apk add --no-cache bash gettext fuse rclone perl-utils 

RUN rclone version

RUN /bin/bash -c curl https://raw.githubusercontent.com/kanisterio/kanister/master/scripts/get.sh | bash -s

RUN sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf

COPY kopia-0.13.0-linux-x64/kopia /bin/

COPY root/ /
