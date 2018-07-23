package main

import (
	"io/ioutil"
	"log"
	"fmt"
	"github.com/luisfernandogaido/stru"
)

func main() {
	bytes, err := ioutil.ReadFile("./stru.sql")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(stru.Stru(string(bytes)))
}
