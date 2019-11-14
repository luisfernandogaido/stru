package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
)

type Base struct {
	Alias    string `json:"alias"`
	Servidor string `json:"servidor"`
	Usuario  string `json:"usuario"`
	Senha    string `json:"senha"`
	Banco    string `json:"banco"`
}

func loadConf() ([]Base, error) {
	host, err := os.Hostname()
	if err != nil {
		return nil, fmt.Errorf("load: %w", err)
	}
	var dir string
	switch host {
	case "MSI75271154":
		dir = "C:\\GoPrograms\\stru"
	default:
		return nil, fmt.Errorf("load: host desconhecido")
	}
	b, err := ioutil.ReadFile(filepath.Join(dir, "stru.json"))
	if err != nil {
		return nil, fmt.Errorf("load: %w", err)
	}
	var bases []Base
	if err := json.Unmarshal(b, &bases); err != nil {
		return nil, fmt.Errorf("load: %w", err)
	}
	return bases, nil
}

func mapBases(bases []Base) map[string]Base {
	mp := make(map[string]Base)
	for _, b := range bases {
		mp[b.Alias] = b
	}
	return mp
}
