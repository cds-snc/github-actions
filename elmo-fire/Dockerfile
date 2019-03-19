FROM alpine:3.9 as builder
MAINTAINER max@neuvians.net
RUN apk add --no-cache crystal=0.27.2-r0 shards=0.8.1-r0 libc-dev=0.7.1-r0 && rm -rf /var/cache/apk/*
WORKDIR /src
COPY . .
RUN crystal build --release --static src/run.cr -o /src/run

FROM scratch

LABEL "name"="elmo-fire"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Elmo-fire"
LABEL "com.github.actions.description"="Sends a message to a slack webhook if a check suite fails"
LABEL "com.github.actions.icon"="fire"
LABEL "com.github.actions.color"="orange"

WORKDIR /app
COPY --from=builder /src/run /app/run
ENTRYPOINT ["/app/run"]
