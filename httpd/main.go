package main

import (
	"os"

	controller "go-getway/httpd/Controller"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func init() {
	err := godotenv.Load()
	if err != nil {
		panic(err)
	}
}

func main() {
	gin.SetMode(os.Getenv("mode"))
	route := gin.Default()

	route.GET("/", controller.IndexCtrl)
	route.NoRoute(controller.APIGetway)

	route.Run()
}
