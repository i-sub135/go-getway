package addone

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Unavailable -- Unavailable response
func Unavailable(res *gin.Context) {

	urls := res.Request.URL.Path
	res.JSON(http.StatusServiceUnavailable, gin.H{
		"code":     http.StatusServiceUnavailable,
		"messages": "Service Unavailable",
		"url":      urls,
	})
}

// NotFound -- NotFound response
func NotFound(res *gin.Context) {

	urls := res.Request.URL.Path
	res.JSON(http.StatusNotFound, gin.H{
		"code":     http.StatusNotFound,
		"messages": "Service Not Found",
		"url":      urls,
	})
}

// NotAllow -- NotFound response
func NotAllow(res *gin.Context) {

	urls := res.Request.URL.Path
	res.JSON(http.StatusMethodNotAllowed, gin.H{
		"code":     http.StatusMethodNotAllowed,
		"messages": "Method Not Allowed",
		"url":      urls,
	})
}
