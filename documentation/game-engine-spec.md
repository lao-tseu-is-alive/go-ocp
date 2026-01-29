# Cognitive City - Go Game Engine Specification

#### *VERSION:  INITIAL DRAFT*

## 1. Core Architecture

```
+--------------------+
|   Client (Web/CLI) |
+--------------------+
           |
           v
+--------------------+
|   Game Engine Core |
+--------------------+
| Scenario Loader    |
| State Machine      |
| Scoring Pipelin    |
| Event Bus          |
+--------------------+
           |
           v
+--------------------+
| Persistence & Export|
+--------------------+
```

---

## 2. Domain Model (Go Interfaces)

```go
type Scenario struct {
    ID       string
    Meta     MetaInfo
    Phases   []Phase
    Scoring  ScoringConfig
}

type Phase interface {
    ID() string
    Execute(ctx GameContext) error
}

type GameState struct {
    Budget           float64
    PublicSupport    float64
    CarbonIndex      float64
    RentIndex         float64
    SegregationIndex float64
}
```

---

## 3. State Machine

### 3.1 States

* INIT
* READING
* LLM_INTERACTION
* DECISION
* SYNTHESIS
* END

### 3.2 Transition Diagram

```
INIT -> READING -> LLM_INTERACTION -> DECISION -> SYNTHESIS -> END
```

---

## 4. Scenario DSL (Go)

```go
type ScenarioLoader interface {
    LoadJSON(path string) (*Scenario, error)
    Validate(s *Scenario) error
}
```

---

## 5. Scoring Pipeline

```go
type Score struct {
    IAS float64 // Attention
    IRP float64 // Reasoning
    IP  float64 // Planning
    IM  float64 // Metacognition
    IIA float64 // AI Usage
    Global float64
}

type ScoringEngine interface {
    ProcessEvents(events []Event) Score
}
```

#### Example Global Score Formula

```go
Global = w1*IAS + w2*IRP + w3*IP + w4*IM + w5*IIA
```

---

## 6. Event System

### 6.1 Go Event Model

```go
type Event struct {
    Timestamp time.Time
    UserID    string
    Type      string
    Payload   map[string]interface{}
}
```

#### Event Types

* READ_START / READ_END
* SCROLL
* LLM_PROMPT
* LLM_RESPONSE
* DECISION_MADE
* DECISION_REVISED
* SPEECH_SUBMITTED

---

## 7. Protobuf Event Schema

```proto
syntax = "proto3";

message Event {
  string user_id = 1;
  string event_type = 2;
  int64 timestamp = 3;
  map<string, string> payload = 4;
}
```

---

## 8. LLM Abstraction Layer Integration

```go
type LLMProvider interface {
    Name() string
    Query(ctx context.Context, prompt string) (string, error)
    Embedding(ctx context.Context, text string) ([]float64, error)
}

type LLMRouter struct {
    Providers []LLMProvider
    Policy    RoutingPolicy
}
```

#### Routing Policies

* RoundRobin
* A/B Testing
* Performance-based
* Sovereign-first (local LLM preferred)

---

## 9. Persistence Layer

* PostgreSQL (events)
* Parquet / S3 (analytics)
* JSON export for reproducibility

---

## 10. CLI Prototype Interface

```bash
ocp play lausanne_housing_2028.json
ocp score session_123.json
ocp export cohort_2028.parquet
```

---

## 11. Reference Implementation Structure

```
/go-ocp
  /cmd/ocp
  /engine
    scenario
    state
    scoring
    events
    llm
  /scenarios
    lausanne_housing_2028.json
  /proto
    event.proto
```

---

## 12. Roadmap Engine

**v0.1** JSON scenario loader + CLI
**v0.2** Event logging + scoring
**v0.3** Web UI
**v1.0** Multi-LLM routing + dashboards

---

## 13. Scientific Exploitability

* Full replay of sessions
* Reproducible experiments
* Cross-LLM benchmarking human vs AI

---
