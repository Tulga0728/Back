# UniversiryAPI

Fibo universiry backend

## Requirement

- [Go](https://golang.org/) - Go programming language

## Run project

Simple run

```sh
./run start
```

Generate [Swaggar](https://swagger.io/) documentation

```sh
./run doc
```

Run with [Swaggar](https://swagger.io/) documentation

```sh
./run start:doc
```

Build

```sh
./run build
```

Init go mod

```sh
./run init
```

## Development

Clone git project

```sh
cd $GOPATH/src/gitlab.com/my_projects1/golang
git clone git@gitlab.com/my_projects1/golang/gingostarter
```

Open project with [Visual Studio Code](https://code.visualstudio.com/)

```sh
code $GOPATH/src/gitlab.com/my_projects1/golang/gingostarter
```

## Install [Visual Studio Code](https://code.visualstudio.com/) extensions

- [Go extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go)

## Deploy

Push master branch. Entrust everything to gitlab runner.

## Docker

Build docker image

```sh
docker build -t caas $GOPATH/src/gitlab.com/virtualsex/crm/back/.
```

Run docker container

```sh
docker run -d -p 8080:8080 caas
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
localhost:8080
```

## Todos

| Status             | Name               | Author            |
| ------------------ | ------------------ | ----------------- |
| :white_check_mark: | Auth               | Uurtsaikh Nyambat |
| :white_check_mark: | User               | Uurtsaikh Nyambat |
| :x:                | Auto generate code | Uurtsaikh Nyambat |
