package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	bases, err := loadConf()
	if err != nil {
		log.Fatal(err)
	}
	mapa := mapBases(bases)
	if len(os.Args) == 1 {
		log.Fatal("informe ao menos uma base")
	}
	for _, alias := range os.Args[1:] {
		fmt.Println(alias)
		base, ok := mapa[alias]
		if !ok {
			log.Fatal(fmt.Sprintf("alias %v desconhecido", alias))
		}
		if err := MysqlDumpStru(alias, base.Servidor, base.Usuario, base.Senha, base.Banco); err != nil {
			log.Fatal(err)
		}
	}
}
