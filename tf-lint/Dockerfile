FROM alpine:3.9

LABEL "name"="terraform-lint"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Terraform lint"
LABEL "com.github.actions.description"="Lints terraform files in your repository"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="orange"

RUN apk add --no-cache bash=4.4.19-r1 ca-certificates=20190108-r0 unzip=6.0-r4 wget=1.20.1-r0
RUN rm -rf /var/cache/apk/*
RUN wget https://github.com/wata727/tflint/releases/download/v0.7.4/tflint_linux_amd64.zip -P /tmp
RUN unzip /tmp/tflint_linux_amd64.zip -d /usr/local/bin

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
