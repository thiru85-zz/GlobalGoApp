FROM golang:1.8-alpine
ADD . /go/src/globalgoapp
RUN go install globalgoapp

FROM alpine:latest
COPY --from=0 /go/bin/globalgoapp .
ENV PORT 8080
EXPOSE 8080
CMD ["./globalgoapp"]