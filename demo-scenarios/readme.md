# Cognitive City — Interactive Scenario Script

> **Purpose:** Provide a machine-readable interactive scenario (JSON) and a complete Go game engine specification capable of executing it.
> This document is designed to be directly implementable in the `go-ocp` repository.

---

## Scenario 01 : 
Vous êtes **Syndic / Mayor de Lausanne** en 2028.  
La ville fait face à une **crise aiguë du logement** :
- loyers en hausse de +35% en 10 ans
- vacance < 0.5%
- tensions sociales et politiques croissantes
- pression écologique et contraintes foncières fortes

Votre mandat : **stabiliser les loyers, maintenir la cohésion sociale et respecter les objectifs climatiques.**

 + Lire la version humaine de ce scenario démo : [scenario01.md](https://github.com/lao-tseu-is-alive/go-ocp/blob/main/demo-scenario/scenario01.md)

 + Voici la version "machine" de ce scenario [scenario01.json](https://github.com/lao-tseu-is-alive/go-ocp/blob/main/demo-scenario/scenario01.json)


## Scenario 02 : 
Vous êtes le président démocratiquement élu d'un pays situé en Europe en 2030.
A cause d'une population veillissante, d'une chute drastique de la natalité depuis plus de 30 ans et d'une absence totale  
d'immigration suite aux mesures draconiennes de "contrôle" mise en place par votre prédécesseur et de sa majorité d'extrème droite 
aujourd'hui déchu face à la situation économique catastrophique vous héritez d'un pays qui fait face 
à un crise aigue de main d'oeuvre ainsi qu'à plusieurs challenges majeurs dont voici une liste non-exhaustive :
... à complèter

####  Design Principles of the Interactive Scenario Script (Machine-Readable)
 
- Declarative scenario definition (data-driven) in [JSON](https://www.json.org/)
- Schema validation with [JSON Schema](https://json-schema.org/)
- Widely used Open Standards 
- [MIT Open Source Licence](https://en.wikipedia.org/wiki/MIT_License)
- Deterministic simulation core + stochastic modifiers
- Event-driven instrumentation for cognitive metrics
- Fully decoupled from UI (web, mobile, CLI)
