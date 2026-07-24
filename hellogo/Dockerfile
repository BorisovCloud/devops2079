# syntax=docker/dockerfile:1
FROM golang:1.25
WORKDIR /src
COPY ./main.go ./main.go
RUN go build -o /bin/hello ./main.go

FROM scratch
COPY --from=0 /bin/hello /bin/hello
CMD ["/bin/hello"]