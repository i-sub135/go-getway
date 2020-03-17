package models

import (
	db "go-getway/httpd/Database"
	"runtime"
	"time"
)

type (
	// APIRoutes -- tb api routes
	APIRoutes struct {
		ID          int
		GroupID     int
		Name        string
		Description string
		Enviroment  string
		Version     int
		Category    string
		Function    string
		Methods     string
		RouteType   string
		ContentType string
		DbID        int
		AuthID      int
		Content     string
		Retry       string
		RetryDelay  string
		Timeout     int
		Enabled     string
		Created     string
		Updated     string
	}

	// APILogs -- tb api logs
	APILogs struct {
		ID      int
		IP      string
		IDApi   int
		Elapse  float64
		Status  string
		Created string
	}
)

var sql = db.Conenect()

// GetRoutes -- get routes
func GetRoutes(mod, ver, cat string) APIRoutes {
	var data APIRoutes
	sql.Table("api_routes").Where("environment=? and version=? and category=? and enabled=1", mod, ver, cat).Find(&data)

	return data
}

// Logs -- api logs
func Logs(ip string, idapi int, elapse float64, status string) {
	runtime.GOMAXPROCS(1)
	now := time.Now().Format("2006-01-02 15:04:05")
	log := APILogs{
		IP:      ip,
		IDApi:   idapi,
		Elapse:  elapse,
		Status:  status,
		Created: now,
	}
	sql.Table("api_logs").Create(&log)
}
