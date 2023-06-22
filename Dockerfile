FROM golang:alpine3.18 as builder
WORKDIR /go/src
COPY . .
RUN go build -o hello .

FROM scratch
COPY --from=builder /go/src . 
CMD ["./hello"]