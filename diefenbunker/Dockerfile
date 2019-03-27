FROM alpine:3.9

LABEL "name"="Diefenbunker"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Uploads your workspace to S3"
LABEL "com.github.actions.description"="Automatically zips up your workspace and uploads it to an S3 bucket"
LABEL "com.github.actions.icon"="cloud-rain"
LABEL "com.github.actions.color"="orange"

RUN apk add --no-cache python2=2.7.15-r3 py2-pip=18.1-r0 py-setuptools=40.6.3-r0 git=2.20.1-r0 ca-certificates=20190108-r0 zip=3.0-r7 && rm -rf /var/cache/apk/*
RUN pip install python-dateutil==2.8.0

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]