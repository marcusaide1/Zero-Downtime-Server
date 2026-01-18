package main
import (
    "fmt"
    "net/http"
)
func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello! This app is running inside a Docker container!")
    })
    http.ListenAndServe(":8080", nil)
}
