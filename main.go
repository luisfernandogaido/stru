package main

import (
	"io/ioutil"
	"log"
	"strings"
	"fmt"
)

func main() {
	bytes, err := ioutil.ReadFile("./stru.sql")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(stru(string(bytes)))
}

func stru(sql string) string {
	linhas := strings.Split(sql, "\r\n")
	novasLinhas := make([]string, 0)
	procedure := false
	var linhaAcumulada string
	for _, l := range linhas {
		if l == "DELIMITER $$" {
			procedure = true
			continue
		}
		if l == "DELIMITER ;" {
			novasLinhas = append(novasLinhas, linhaAcumulada)
			linhaAcumulada = ""
			procedure = false
			continue
		}
		if !procedure {
			novasLinhas = append(novasLinhas, l)
			continue
		}
		linhaAcumulada += " " + strings.Replace(l, "$$", ";", 1)
	}
	return strings.Join(novasLinhas, "\r\n")
}
