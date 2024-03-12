# stage 1
# 
FROM golang:1.16-alpine as builder

WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /server

# stage 2
# 
FROM scratch
WORKDIR /app
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder server /app/server
EXPOSE 8080
CMD ["/app/server"]