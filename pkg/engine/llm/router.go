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
