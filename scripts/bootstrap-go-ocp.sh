#!/usr/bin/env bash
# ============================================================
# Bootstrap script for go-ocp project structure (pkg/ layout)
# This script:
# 1) Creates directory structure
# 2) Writes Go source files and proto files
# 3) Prints recommended commands to run (without executing)
# ============================================================

set -e

PROJECT="go-ocp"
MODULE_PATH="github.com/lao-tseu-is-alive/go-ocp"

# ------------------------------------------------------------
# 0. Prerequisites (documentation only)
# ------------------------------------------------------------
cat <<'EOF'
# ============================================================
# PREREQUISITES (manual installation)
# ============================================================
# Go >= 1.21
#   https://go.dev/dl/
#
# Buf CLI (for modern protobuf workflows):
#   https://buf.build/docs/installation
#
# Optional (for future phases):
#   - protoc (if not using Buf remote plugins)
#   - Docker (for ClickHouse, Postgres, etc.)
# ============================================================
EOF

# ------------------------------------------------------------
# 1. Create directory structure
# ------------------------------------------------------------
mkdir -p cmd/ocp
mkdir -p pkg/engine/{scenario,state,phases,events,scoring,llm,persistence}
mkdir -p scenarios
mkdir -p proto

# ------------------------------------------------------------
# 2. Write go.mod (template) ony if not already there
# ------------------------------------------------------------
if test -f go.mod; then
  echo "## go.mod is already there, skipping"
else
  cat > go.mod <<EOF
module ${MODULE_PATH}

go 1.21
EOF
fi

# ------------------------------------------------------------
# 3. cmd/ocp/main.go
# ------------------------------------------------------------
cat > cmd/ocp/main.go <<'EOF'
package main

import (
    "log"

    "github.com/lao-tseu-is-alive/go-ocp/pkg/engine"
    "github.com/lao-tseu-is-alive/go-ocp/pkg/engine/scenario"
)

func main() {
    sc, err := scenario.LoadJSON("scenarios/lausanne_housing_2028.json")
    if err != nil {
        log.Fatal(err)
    }

    e := engine.New(sc)
    e.Run()
}
EOF

# ------------------------------------------------------------
# 4. Engine core
# ------------------------------------------------------------
cat > pkg/engine/engine.go <<'EOF'
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
EOF

# ------------------------------------------------------------
# 5. Scenario models and loader
# ------------------------------------------------------------
cat > pkg/engine/scenario/model.go <<'EOF'
package scenario

type Scenario struct {
    ScenarioID   string        `json:"scenario_id"`
    Meta         MetaInfo       `json:"meta"`
    InitialState InitialState   `json:"initial_state"`
    Phases        []Phase        `json:"phases"`
    Scoring       ScoringConfig  `json:"scoring"`
}

type MetaInfo struct {
    Title   string `json:"title"`
    Version string `json:"version"`
}

type InitialState struct {
    Budget           float64 `json:"budget"`
    PublicSupport    float64 `json:"public_support"`
    CarbonIndex      float64 `json:"carbon_index"`
    RentIndex         float64 `json:"rent_index"`
    SegregationIndex float64 `json:"segregation_index"`
}

type Phase struct {
    ID   string `json:"id"`
    Type string `json:"type"`
}

type ScoringConfig struct {
    Weights map[string]float64 `json:"weights"`
}
EOF

cat > pkg/engine/scenario/loader.go <<'EOF'
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
EOF

# ------------------------------------------------------------
# 6. Game State
# ------------------------------------------------------------
cat > pkg/engine/state/state.go <<'EOF'
package state

import "github.com/lao-tseu-is-alive/go-ocp/pkg/engine/scenario"

type GameState struct {
    Budget           float64
    PublicSupport    float64
    CarbonIndex      float64
    RentIndex         float64
    SegregationIndex float64
}

func NewGameState(init scenario.InitialState) *GameState {
    return &GameState{
        Budget:           init.Budget,
        PublicSupport:    init.PublicSupport,
        CarbonIndex:      init.CarbonIndex,
        RentIndex:         init.RentIndex,
        SegregationIndex: init.SegregationIndex,
    }
}
EOF

# ------------------------------------------------------------
# 7. Events
# ------------------------------------------------------------
cat > pkg/engine/events/event.go <<'EOF'
package events

import "time"

type Event struct {
    UserID    string                 `json:"user_id"`
    Type      string                 `json:"type"`
    Timestamp time.Time              `json:"timestamp"`
    Payload   map[string]interface{} `json:"payload"`
}
EOF

# ------------------------------------------------------------
# 8. Scoring
# ------------------------------------------------------------
cat > pkg/engine/scoring/metrics.go <<'EOF'
package scoring

type Score struct {
    IAS    float64
    IRP    float64
    IP     float64
    IM     float64
    IIA    float64
    Global float64
}
EOF

cat > pkg/engine/scoring/engine.go <<'EOF'
package scoring

type Engine struct {
    Weights map[string]float64
}

func (e *Engine) Compute(s Score) float64 {
    return e.Weights["attention"]*s.IAS +
        e.Weights["reasoning"]*s.IRP +
        e.Weights["planning"]*s.IP +
        e.Weights["metacognition"]*s.IM +
        e.Weights["ai_usage"]*s.IIA
}
EOF

# ------------------------------------------------------------
# 9. LLM abstraction
# ------------------------------------------------------------
cat > pkg/engine/llm/provider.go <<'EOF'
package llm

import "context"

type Provider interface {
    Name() string
    Query(ctx context.Context, prompt string) (string, error)
    Embedding(ctx context.Context, text string) ([]float64, error)
}
EOF

cat > pkg/engine/llm/router.go <<'EOF'
package llm

type Router struct {
    Providers []Provider
}

func (r *Router) Pick() Provider {
    if len(r.Providers) == 0 {
        return nil
    }
    return r.Providers[0]
}
EOF

# ------------------------------------------------------------
# 10. Protobuf schema
# ------------------------------------------------------------
cat > proto/event.proto <<'EOF'
syntax = "proto3";

message Event {
  string user_id = 1;
  string event_type = 2;
  int64 timestamp = 3;
  map<string, string> payload = 4;
}
EOF

# ------------------------------------------------------------
# 11. Scenario JSON placeholder
# ------------------------------------------------------------
cat > scenarios/lausanne_housing_2028.json <<'EOF'
{
  "scenario_id": "lausanne_housing_2028",
  "meta": {"title": "Crise du logement à Lausanne", "version": "1.0"},
  "initial_state": {
    "budget": 100,
    "public_support": 70,
    "carbon_index": 60,
    "rent_index": 100,
    "segregation_index": 40
  },
  "phases": [],
  "scoring": {
    "weights": {
      "attention": 0.2,
      "reasoning": 0.25,
      "planning": 0.25,
      "metacognition": 0.15,
      "ai_usage": 0.15
    }
  }
}
EOF

# ------------------------------------------------------------
# 12. Final instructions (DO NOT EXECUTE automatically)
# ------------------------------------------------------------
cat <<'EOF'

# ============================================================
# NEXT STEPS (run manually)
# ============================================================
# 1) Initialize Go modules (already created go.mod, but tidy deps):
#    go mod tidy
#
# 2) (Optional) Initialize Buf for protobuf workflow:
#    buf config init
#
# 3) Generate protobuf code (example with Buf):
#    buf generate
#
# 4) Run the engine prototype:
#    go run ./cmd/ocp
# ============================================================
EOF
