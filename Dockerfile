#Stage 1: BUILD
FROM golang:alpine AS BUILD
ENV TZ=Asia/Ulaanbaatar
ENV GO111MODULE=on
RUN apk add bash ca-certificates git gcc g++ libc-dev
RUN apk add --update tzdata
WORKDIR /go/src/gitlab.com/virtualsex/crm/back
COPY . .
RUN go get -u github.com/swaggo/swag/cmd/swag
RUN swag init
RUN go mod tidy
RUN go build

# Stage 2: RUN
FROM alpine
ENV TZ Asia/Ulaanbaatar
RUN apk add --no-cache tzdata ca-certificates 
WORKDIR /home
COPY --from=BUILD /go/src/gitlab.com/virtualsex/crm/back/back /home/
COPY --from=BUILD /go/src/gitlab.com/virtualsex/crm/back/config.yml /home/
COPY --from=BUILD /go/src/gitlab.com/virtualsex/crm/back/docs /home/
ENTRYPOINT ["/home/back"]