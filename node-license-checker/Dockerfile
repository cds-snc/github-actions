FROM node:10-alpine

LABEL "name"="node-license-checker"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Node license checker"
LABEL "com.github.actions.description"="Checks your node licenses for compatability"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="orange"

RUN apk add --no-cache bash=4.4.19-r1
RUN rm -rf /var/cache/apk/*

RUN npm install -g license-checker@25.0.1

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
