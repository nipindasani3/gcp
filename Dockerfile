FROM golang:1.8-alpine
ADD . /go/src/gcp
RUN go install gcp

FROM alpine:latest
COPY --from=0 /go/bin/gcp
ENV PORT 8080
CMD ["./gcp"]
