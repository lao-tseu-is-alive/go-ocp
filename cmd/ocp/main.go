package main

import (
	"log"

	"github.com/lao-tseu-is-alive/go-ocp/pkg/engine"
	"github.com/lao-tseu-is-alive/go-ocp/pkg/engine/scenario"
)

func main() {
	//sc, err := scenario.LoadJSON("scenarios/lausanne_housing_2028.json")
	sc, err := scenario.LoadJSON("demo-scenarios/scenario01.json")
	if err != nil {
		log.Fatal(err)
	}

	e := engine.New(sc)
	e.Run()
}
