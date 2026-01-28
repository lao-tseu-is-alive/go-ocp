package events

import "time"

type Event struct {
	UserID    string                 `json:"user_id"`
	Type      string                 `json:"type"`
	Timestamp time.Time              `json:"timestamp"`
	Payload   map[string]interface{} `json:"payload"`
}
