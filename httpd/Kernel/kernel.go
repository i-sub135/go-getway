package kernel

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

// ProsesAPI -- api proxy proses
func ProsesAPI(res *gin.Context) (map[string]interface{}, int, error) {

	ur := res.Request.RequestURI
	basePath := "/admin/data/bases/"
	baseURL := "http://ved.carsworld.id:7012"

	uris := strings.ReplaceAll(ur, basePath, "")

	// dump := res.Params

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

	return data, response.StatusCode, nil

}
