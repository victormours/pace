package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
)

func loadTemplate(filename string) (string) {
	template, _ := ioutil.ReadFile("templates/" + filename + ".html")
	return string(template)
}

func templateNames() ([]string) {
  templateFiles, _ := ioutil.ReadDir("templates")
  names := make([]string, 0)
  for _, templateFile := range templateFiles {
    names = append(names, templateFile.Name()[0:len(".html")])
  }
  return names
}

func templateHandler(writer http.ResponseWriter, request *http.Request) {
  template := loadTemplate(request.URL.Path[1:])
	fmt.Fprintf(writer, string(template))
}

func main() {
  for _, templateName := range templateNames() {
    http.HandleFunc("/" + templateName, templateHandler)
  }
  fmt.Printf("Starting server on port 8080")
	http.ListenAndServe(":8080", nil)
}
