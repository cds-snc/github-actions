FROM alpine:3.9 as builder
RUN apk add --no-cache crystal=0.27.0-r0 shards=0.8.1-r0 libc-dev=0.7.1-r0 openssl-dev=1.1.1b-r1 zlib-dev=1.2.11-r1 && rm -rf /var/cache/apk/*
WORKDIR /src
COPY . .
RUN crystal build --release --static src/run.cr -o /src/run

FROM alpine:3.9

RUN apk add --no-cache openssl-dev=1.1.1b-r1 && rm -rf /var/cache/apk/*

LABEL "name"="lighthouse-score"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Lighthouse score"
LABEL "com.github.actions.description"="Runs a lighthouse check on a deployment and fails if it does not meet certain scores"
LABEL "com.github.actions.icon"="fire"
LABEL "com.github.actions.color"="orange"

WORKDIR /app
COPY --from=builder /src/run /app/run
ENTRYPOINT ["/app/run"]
