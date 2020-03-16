package controller

import (
	"net/http"

	kernel "go-getway/httpd/Kernel"

	"github.com/gin-gonic/gin"
)

// IndexCtrl -- index controller
func IndexCtrl(res *gin.Context) {
	res.JSON(http.StatusOK, gin.H{
		"code":     200,
		"messages": "OK",
		"result":   "go api getway",
	})
}

// APIGetway -- api handler
func APIGetway(res *gin.Context) {

	urls := res.Request.URL.Path
	// head := res.Request.Header
	// method := res.Request.Method

	// for ke, val := range head {
	// 	fmt.Printf("==:: %v ==> %v \n", ke, val[0])
	// }
	// fmt.Println(method)
	// fmt.Println(reqBody)

	proses, code, _ := kernel.ProsesAPI(res)
	if proses == nil {
		res.JSON(http.StatusServiceUnavailable, gin.H{
			"code":     http.StatusServiceUnavailable,
			"messages": "Service Unavailable",
			"url":      urls,
		})

		return
	}
	res.JSON(code, proses)
}
