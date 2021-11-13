FROM amazon/aws-cli:2.1.29

RUN yum update && yum install -y keepalived procps sysvinit-tools

ENTRYPOINT ["/usr/bin/startup.sh"]

COPY /src/keepalived.conf.tmpl /etc/keepalived/keepalived.conf

COPY /src/notify-master-script.sh /etc/keepalived/notify-master-script.sh

COPY /src/notify-backup-script.sh /etc/keepalived/notify-backup-script.sh

COPY /src/check-script.sh /etc/keepalived/check-script.sh

COPY /src/startup.sh /usr/bin/startup.sh
