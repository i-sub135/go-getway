package controller

import (
	"fmt"
	"net/http"
	"strings"

	addone "go-getway/httpd/Addone"
	kernel "go-getway/httpd/Kernel"
	model "go-getway/httpd/Models"

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
	split := strings.Split(urls, "/")
	mod := addone.CheckMode(split[1])
	ver := split[2]
	cat := split[3]

	apiRoutes := model.GetRoutes(mod, ver, cat)
	if apiRoutes.ID == 0 {
		addone.NotFound(res)
		return
	}
	if res.Request.Method != apiRoutes.Methods {
		addone.NotAllow(res)
		return
	}

	path := fmt.Sprintf("/%v/%v/%v/", split[1], apiRoutes.Version, apiRoutes.Category)
	proses, code, _ := kernel.ProsesAPI(res, path, apiRoutes.Content, apiRoutes.ID)
	if proses == nil {
		addone.Unavailable(res)
		return
	}

	res.JSON(code, proses)
}
