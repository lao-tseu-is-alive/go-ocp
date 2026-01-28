package engine

import (
	"log"

	"github.com/lao-tseu-is-alive/go-ocp/pkg/engine/scenario"
	"github.com/lao-tseu-is-alive/go-ocp/pkg/engine/state"
)

type Engine struct {
	Scenario *scenario.Scenario
	State    *state.GameState
}

func New(s *scenario.Scenario) *Engine {
	return &Engine{
		Scenario: s,
		State:    state.NewGameState(s.InitialState),
	}
}

func (e *Engine) Run() {
	log.Println("Starting scenario:", e.Scenario.Meta.Title)

	for _, p := range e.Scenario.Phases {
		log.Println("Phase:", p.ID)
		// TODO: Phase dispatching by type
		_ = p
	}

	log.Println("Scenario finished.")
}
