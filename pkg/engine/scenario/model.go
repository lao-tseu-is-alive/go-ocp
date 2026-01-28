package scenario

type Scenario struct {
	ScenarioID   string        `json:"scenario_id"`
	Meta         MetaInfo      `json:"meta"`
	InitialState InitialState  `json:"initial_state"`
	Phases       []Phase       `json:"phases"`
	Scoring      ScoringConfig `json:"scoring"`
}

type MetaInfo struct {
	Title   string `json:"title"`
	Version string `json:"version"`
}

type InitialState struct {
	Budget           float64 `json:"budget"`
	PublicSupport    float64 `json:"public_support"`
	CarbonIndex      float64 `json:"carbon_index"`
	RentIndex        float64 `json:"rent_index"`
	SegregationIndex float64 `json:"segregation_index"`
}

type Phase struct {
	ID   string `json:"id"`
	Type string `json:"type"`
}

type ScoringConfig struct {
	Weights map[string]float64 `json:"weights"`
}
