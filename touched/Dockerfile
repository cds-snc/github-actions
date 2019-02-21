FROM alpine:latest as builder
RUN apk add -u crystal shards libc-dev
WORKDIR /src
COPY . .
RUN crystal build --release --static src/run.cr -o /src/run

FROM scratch
WORKDIR /app
COPY --from=builder /src/run /app/run
ENTRYPOINT ["/app/run"]

