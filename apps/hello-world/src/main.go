package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", HelloEndpoint)
	http.ListenAndServe(":80", nil)
}

func HelloEndpoint(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "%s or hello %s!", os.Getenv("HELLO"), r.URL.Path[1:])
}
