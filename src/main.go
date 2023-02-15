package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("'http://localhost:8080/' にアクセスしてください")

	http.HandleFunc("/", serveHelloWorld)
	http.ListenAndServe(":8080", nil)
	err := http.ListenAndServe("localhost:8080", nil)
	fmt.Println(err.Error())
}

type String string

func serveHelloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello, worlasdfsadfasdd!")
}
