package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
  "github.com/hoisie/mustache"
  "encoding/json"
)

//func templateFilename(requestURL string) (string) {
//	return "templates" + requestURL + ".html"
//}

func templateNames() ([]string) {
  templateFiles, _ := ioutil.ReadDir("templates")
  names := make([]string, 0)
  for _, templateFile := range templateFiles {
    name := templateFile.Name()
    names = append(names, name[:len(name) - len(".html")])
  }
  fmt.Printf("%s", names)
  return names
}

func apiRequest(originalRequest *http.Request) ([]byte) {
  apiURL := "http://localhost:9292"
  var apiResponse *http.Response
  if originalRequest.Method == "GET" {
    apiResponse, _ = http.Get(apiURL + originalRequest.URL.Path)
  }
  responseBytes, _ := ioutil.ReadAll(apiResponse.Body)
  return responseBytes
}

func jsonResponse(originalRequest *http.Request) (interface{}) {
  jsonBytes := apiRequest(originalRequest)
  var jsonMap interface{}
  json.Unmarshal(jsonBytes, &jsonMap)
  return jsonMap
}

func templateHandler(writer http.ResponseWriter, request *http.Request) {
  // template := templateFilename(request.URL.Path)
  template := templateFilename(request)
  jsonData := jsonResponse(request)
  page := mustache.RenderFile(template, jsonData)
	fmt.Fprintf(writer, page)
}

func main() {
  for _, templateName := range templateNames() {
    http.HandleFunc("/" + templateName, templateHandler)
  }
  fmt.Printf("Starting server on port 8080\n")
	http.ListenAndServe(":8080", nil)
}
