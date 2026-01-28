package llm

import "context"

type Provider interface {
	Name() string
	Query(ctx context.Context, prompt string) (string, error)
	Embedding(ctx context.Context, text string) ([]float64, error)
}
