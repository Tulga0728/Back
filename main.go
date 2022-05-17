package main

import (
	"net/http"

	gin "github.com/gin-gonic/gin"
	viper "github.com/spf13/viper"
	controllers "gitlab.com/virtualsex/crm/back/controllers"
)

// CORS cors enable
func CORS(c *gin.Context) {
	c.Header("Content-Type", "application/json")
	c.Header("Access-Control-Allow-Origin", "*")
	c.Header("Access-Control-Allow-Headers", "*")
	c.Header("Access-Control-Allow-Methods", "*")
	c.Header("Access-Control-Allow-Credentials", "true")
	if c.Request.Method == http.MethodOptions {
		c.AbortWithStatus(http.StatusNoContent)
		return
	}
	c.Next()
}

// Router Application Routers
func Router(app *gin.Engine) *gin.Engine {
	api := app.Group("/api/v1")
	controllers.Init(api)
	return app
}

func main() {
	viper.AddConfigPath(".")
	err := viper.ReadInConfig()
	if err != nil {
		panic(err.Error())
	}
	app := gin.Default()
	app.Use(CORS)
	app = Router(app)
	app.Run(":8082")
}
