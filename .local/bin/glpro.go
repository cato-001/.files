package main

import (
	"fmt"
	"os/exec"
	"strings"
)

func main() {
	cmd := exec.Command("fd", "^\\.git$", "--type", "directory", "--unrestricted", "--maxdepth", "2")
	output, err := cmd.Output()
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	for _, repo := range strings.Split(string(output), "\n") {
		repo = strings.Trim(repo, " \t\n\r")
		if repo == "" {
			continue
		}
		repo = strings.TrimSuffix(repo, "/.git/")

		cmd := exec.Command("git", "rev-parse", "--abbrev-ref", "HEAD")
		cmd.Dir = repo
		byte_branch, err := cmd.Output()
		if err != nil {
			fmt.Println("Error:", err)
			continue
		}
		branch := string(byte_branch)
		branch = strings.Trim(branch, " \t\n\r")

		if !(branch == "main" || branch == "master") {
			fmt.Println("Skipping:", repo, branch)
			continue
		}

		fmt.Println("Pulling", repo, branch)
		cmd = exec.Command("git", "pull")
		cmd.Dir = repo
		err = cmd.Run()
		if err != nil {
			fmt.Println("Error Pulling:", repo, branch)
		}
	}

}
