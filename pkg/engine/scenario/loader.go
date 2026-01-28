package scenario

import (
	"encoding/json"
	"os"
)

func LoadJSON(path string) (*Scenario, error) {
	b, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	var s Scenario
	err = json.Unmarshal(b, &s)
	return &s, err
}
