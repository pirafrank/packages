FROM fedora:latest

RUN rpm --import https://pkg.fpira.com/yum/gpg.pub
RUN tee /etc/yum.repos.d/pkg.fpira.com.repo << EOF
[pirafrank]
name=pirafrank
baseurl=https://pkg.fpira.com/yum/el8/$(uname -m)/
enabled=1
gpgcheck=1
gpgkey=https://pkg.fpira.com/yum/gpg.pub
EOF

COPY ./assets/yum.sh /yum.sh
RUN chmod +x /yum.sh

CMD ["/bin/bash", "/yum.sh", "poof"]
