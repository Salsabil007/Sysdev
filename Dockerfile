FROM golang:1.11 as builder
RUN mkdir -p /home/salsabil-arabi/Desktop/sysdev
WORKDIR /home/salsabil-arabi/Desktop/sysdev
COPY Product_Api.go .
RUN go get github.com/gorilla/mux
RUN CGO_ENABLED=0 GOOS=linux go build -o sysdev .

FROM golang:1.11
COPY --from=builder /home/salsabil-arabi/Desktop/sysdev/sysdev /usr/bin/sysdev
ENTRYPOINT ["sysdev"]


