package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
)

func loadTemplate(filename string) (string) {
	template, _ := ioutil.ReadFile(filename)
	return string(template)
}


func templateNames() ([]string) {
  templateFiles, _ := ioutil.ReadDir("templates")
  names := make([]string, 0)
  for i := range templateFiles {
    names = append(names, templateFiles[i].Name())
  }
  return names
}

func handler(writer http.ResponseWriter, request *http.Request) {
  template := loadTemplate(request.URL.Path[1:])
	fmt.Fprintf(writer, string(template))
}

func main() {
  availableTemplates := templateNames()
  fmt.Printf("%s", availableTemplates)
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
