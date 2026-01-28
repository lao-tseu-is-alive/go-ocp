package state

import "github.com/lao-tseu-is-alive/go-ocp/pkg/engine/scenario"

type GameState struct {
	Budget           float64
	PublicSupport    float64
	CarbonIndex      float64
	RentIndex        float64
	SegregationIndex float64
}

func NewGameState(init scenario.InitialState) *GameState {
	return &GameState{
		Budget:           init.Budget,
		PublicSupport:    init.PublicSupport,
		CarbonIndex:      init.CarbonIndex,
		RentIndex:        init.RentIndex,
		SegregationIndex: init.SegregationIndex,
	}
}
