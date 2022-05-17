home				=	$(shell home)
software_version	=	$(shell cat VERSION)
version_array		=	$(subst ., ,$(software_version))
major				=	$(word 1,${version_array})
minor				=	$(word 2,${version_array})
patch				=	$(word 3,${version_array})
pwd					=	$(shell pwd)

patch:
	- @echo "BUMPING PATCH"
	- @echo "Current Version: $(software_version)"
	- $(eval patch=$(shell echo $$(($(patch)+1))))
	- @echo "New Version: $(major).$(minor).$(patch)"
	- @printf $(major).$(minor).$(patch) > VERSION

minor:
	- @echo "BUMPING MINOR"
	- @echo "Current Version: $(software_version)"
	- $(eval minor=$(shell echo $$(($(minor)+1))))
	- @echo "New Version: $(major).$(minor).0"
	- @printf $(major).$(minor).0 > VERSION

major:
	- @echo "BUMPING MAJOR"
	- @echo "Current Version: $(software_version)"
	- $(eval major=$(shell echo $$(($(major)+1))))
	- @echo "New Version: $(major).0.0"
	- @printf $(major).0.0 > VERSION

requirements:
	- go get -u golang.org/x/lint/golint

build:
	- CGO_ENABLED=0 GOOS=linux go build -a -gcflags='-N -l' -installsuffix cgo -o main .

start:
	- go run main.go

start-prod:
	- GIN_MODE=release go run main.go

lint:
	- go vet
	- golint

tidy:
	- go mod tidy

.PHONY: build patch minor major start start-prod lint tidy requirements