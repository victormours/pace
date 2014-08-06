package main

import (
  "net/http"
)

type Router struct {
  func templateFilename(request *http.Request) (string) {
requestPath := request.URL.Path
               return "templates" + requestPath + ".html"
  }
}

func loadFromConfig(configFilename string) (Router) {

}


