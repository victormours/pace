package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
)

func loadTemplate(filename string) ([]byte, error) {
	return ioutil.ReadFile(filename)
}

func handler(writer http.ResponseWriter, request *http.Request) {
	template, _ := loadTemplate("templates/outbox.html")
	fmt.Fprintf(writer, string(template))
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
