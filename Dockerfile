FROM golang:1.20 as builder

WORKDIR /app
COPY . .

RUN go mod download
RUN go build -o /app/ja3proxy

FROM gcr.io/distroless/cc-debian12

COPY --from=builder /app/ja3proxy /
ENTRYPOINT ["/ja3proxy"]
