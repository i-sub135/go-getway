run:
	go run httpd/main.go

autostart:
	reflex -r '\.go' -s -- sh -c 'go run httpd/main.go'

build:
	go build httpd/*.go

start:
	./main