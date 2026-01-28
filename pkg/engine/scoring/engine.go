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
