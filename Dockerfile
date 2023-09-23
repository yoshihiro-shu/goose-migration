 FROM golang:1.21-alpine3.18

ENV ROOT=/go/src
WORKDIR ${ROOT}

RUN go install github.com/pressly/goose/v3/cmd/goose@latest

COPY . ./

ENTRYPOINT ["sh", "./entrypoint.sh"]