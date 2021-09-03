package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	print("Hello")
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "oi",
		})
	})
	r.POST("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Mange",
			"name":    "Jack",
		})
	})
	r.Run()
}
