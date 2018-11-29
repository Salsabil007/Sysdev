FROM golang:1.7.5

WORKDIR /Desktop/Sysdev
COPY .git     .
COPY first.go   .

RUN GIT_COMMIT=$(git rev-list -1 HEAD) && \
  go build -ldflags "-X main.GitCommit=$GIT_COMMIT"

CMD ["./sysdev"]
