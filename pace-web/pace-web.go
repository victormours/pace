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
    name := templateFile.Name()
    names = append(names, name[:len(name) - len(".html")])
  }
  return names
}

func apiRequest(originalRequest *http.Request) (string) {
  apiURL := "http://localhost:9292"
  if originalRequest.Method == "GET" {
    apiResponse, _ := http.Get(apiURL + originalRequest.URL.Path)
    responseBytes, _ := ioutil.ReadAll(apiResponse.Body)
    return string(responseBytes)
  }
  return ""
}

func templateHandler(writer http.ResponseWriter, request *http.Request) {
  template := loadTemplate(request.URL.Path[1:])
	fmt.Fprintf(writer, string(template))
	fmt.Fprintf(writer, apiRequest(request))
}

func main() {
  for _, templateName := range templateNames() {
    http.HandleFunc("/" + templateName, templateHandler)
  }
  fmt.Printf("Starting server on port 8080\n")
	http.ListenAndServe(":8080", nil)
}
