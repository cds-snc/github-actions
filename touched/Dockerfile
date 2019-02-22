FROM alpine:latest as builder
RUN apk add -u crystal shards libc-dev
WORKDIR /src
COPY . .
RUN crystal build --release --static src/run.cr -o /src/run

FROM scratch

LABEL "name"="touched"
LABEL "maintainer"="Max Neuvians <max.neuvians@cds-snc.ca>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="File touched"
LABEL "com.github.actions.description"="Uses a pattern to see if any files in that pattern have been touched"
LABEL "com.github.actions.icon"="file"
LABEL "com.github.actions.color"="orange"

WORKDIR /app
COPY --from=builder /src/run /app/run
ENTRYPOINT ["/app/run"]
