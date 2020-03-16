package kernel

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"time"

	model "go-getway/httpd/Models"

	"github.com/gin-gonic/gin"
)

// ProsesAPI -- api proxy proses
func ProsesAPI(res *gin.Context, path, baseURL string, idapi int) (map[string]interface{}, int, error) {
	start := time.Now()

	ur := res.Request.RequestURI
	uris := strings.ReplaceAll(ur, path, "")
	url := fmt.Sprintf("%v/%v", baseURL, uris)

	head := res.Request.Header

	var data map[string]interface{}
	var err error
	var client = &http.Client{}

	method := res.Request.Method
	request, err := http.NewRequest(method, url, nil)
	if err != nil {
		return nil, -1, err
	}

	for key, val := range head {
		request.Header.Set(key, val[0])
	}

	response, err := client.Do(request)
	if err != nil {
		fmt.Println("errs client.Do(request)")
		return nil, -1, err
	}

	defer response.Body.Close()
	_ = json.NewDecoder(response.Body).Decode(&data)

	elapsed := float64(time.Since(start)) / float64(1000000)

	// Create logs api
	ip := res.Request.RemoteAddr
	go model.Logs(ip, idapi, elapsed)
	return data, response.StatusCode, nil

}
