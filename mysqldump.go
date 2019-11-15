package main

import (
	"bufio"
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
)

var (
	reAutInc = regexp.MustCompile(` AUTO_INCREMENT=\d+`)
	reDefine = regexp.MustCompile(" DEFINER=`[^`]+`@`[^`]+`")
	reCharse = regexp.MustCompile(`/\*!50503 ([^*]+) \*/`)
)

func MysqlDumpStru(alias, servidor, usuario, senha, base string) error {

	erro := func(err error) error {
		return fmt.Errorf("mysqldump: %w", err)
	}

	cmd := exec.Command(
		"mysqldump",
		"-h",
		servidor,
		"-u"+usuario,
		"-p"+senha,
		"--no-data",
		"--routines",
		"--compact",
		base,
	)
	b, err := cmd.Output()
	if err != nil {
		return erro(err)
	}

	b = reAutInc.ReplaceAll(b, nil)
	b = reDefine.ReplaceAll(b, nil)
	b = reCharse.ReplaceAll(b, []byte(" $1 "))
	s := bufio.NewScanner(bytes.NewReader(b))
	f, err := os.Create(filepath.Join("./", alias+".sql"))
	if err != nil {
		return erro(err)
	}
	defer f.Close()
	for s.Scan() {
		if strings.Contains(s.Text(), "SET sql_mode") {
			continue
		}
		_, err = f.WriteString(fmt.Sprintf("%v\n", strings.ToLower(s.Text())))
		if err != nil {
			return erro(err)
		}
	}
	return nil
}
