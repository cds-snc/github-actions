FROM alpine:3.9

RUN apk add --no-cache python2=2.7.15-r3 py2-pip=18.1-r0 py-setuptools=40.6.3-r0 git=2.20.1-r0 ca-certificates=20190108-r0 zip=3.0-r7 && rm -rf /var/cache/apk/*
RUN pip install python-dateutil

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh