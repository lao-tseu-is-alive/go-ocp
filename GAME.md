# Cognitive City — Game Concept (OCP)

> **Tagline:** *Votre intelligence à l’âge de l’IA*  
> Serious game ludique servant à mesurer et comprendre les profils cognitifs humains dans l’interaction avec l’IA.

---

# 1. Vision du jeu
**Cognitive City** est un jeu de simulation narrative où le joueur gouverne une ville confrontée à des crises complexes (climat, urbanisme, économie, gouvernance).  
Le joueur peut consulter une IA comme conseiller, mais doit prendre les décisions finales.

Le jeu est conçu pour :
- attirer un large public (citoyens, étudiants, cadres, décideurs)
- collecter des métriques cognitives anonymisées
- fournir un observatoire populationnel de la cognition à l’ère de l’IA

---

# 2. Boucle de gameplay (Core Loop)
1. **Situation complexe présentée** (texte, données, graphiques)
2. **Phase de lecture / exploration**
3. **Consultation optionnelle de l’IA** (prompt libre)
4. **Décision multi-critères** (choix politiques, techniques, budgétaires)
5. **Conséquences simulées** (court, moyen, long terme)
6. **Feedback cognitif au joueur** (profil, badges, narration)

---

# 3. Scénarios (Missions)
## 3.1 Crise urbaine
- Explosion des loyers
- Conflit social
- Arbitrages politiques

## 3.2 Transition énergétique
- Pénurie d’électricité
- Choix d’infrastructures
- Acceptabilité sociale

## 3.3 Gouvernance algorithmique
- Introduction d’IA dans l’administration
- Risques de biais
- Régulation

## 3.4 Pandémie cognitive (désinformation)
- Flux d’informations contradictoires
- Mesures publiques
- Gestion de la confiance

---

# 4. Mécaniques de jeu
## 4.1 Lecture longue (Deep Reading)
- Documents multi-pages
- Données contradictoires
- Délai volontaire (attention gating)

## 4.2 Interaction IA instrumentée
- Chat intégré
- Prompts libres
- Traces cognitives analysées

## 4.3 Décision multi-objectifs
- Budget
- Opinion publique
- Indicateurs sociaux et économiques

## 4.4 Synthèse narrative
- Résumer une situation
- Argumenter une politique
- Rédiger un discours public

---

# 5. Système de scoring cognitif
> ⚠️ Le jeu ne mesure pas le QI mais des **indices d’interaction cognitive**.

## 5.1 Indices principaux
- **IAS – Index d’Attention Soutenue**  
  Temps de lecture, scrolling, pauses, retour aux sources.

- **IRP – Index de Raisonnement Profond**  
  Cohérence logique des décisions, non-myopie temporelle.

- **IP – Index de Planification**  
  Anticipation long terme vs court-termisme.

- **IM – Index de Métacognition**  
  Corrections, doutes, itérations, auto-questionnement.

- **IIA – Index d’Interaction avec l’IA**  
  Dépendance, critique, validation indépendante.

---

# 6. Algorithmes de scoring (esquisse)
## 6.1 IAS (Attention)
```

IAS = f(time_on_text, scroll_depth, rereads, distraction_events)

```

## 6.2 IRP (Raisonnement)
```

IRP = semantic_consistency(decisions, scenario_ground_truth)

```

## 6.3 IP (Planification)
```

IP = weight(long_term_outcomes) / weight(short_term_rewards)

```

## 6.4 IM (Métacognition)
```

IM = edits + reversals + explicit_uncertainty_markers

```

## 6.5 IIA (Usage IA)
```

IIA = dependency_ratio + critique_markers - blind_copy

```

---

# 7. Feedback au joueur (ludification)
- Profil cognitif narratif (explorateur, stratège, décideur politique, technocrate…)
- Comparaison anonymisée par cohorte d’âge
- Badges (Deep Thinker, AI Skeptic, Visionary Planner…)
- Evolution dans le temps (longitudinal)

---

# 8. Mode Démo Politique (killer feature)
Un mode spécial pour décideurs publics :
- Visualisation agrégée par génération
- Effets de politiques simulées sur profils cognitifs
- Tableau de bord pour politique éducative et numérique

---

# 9. Architecture technique (MVP)
## 9.1 Frontend
- Web (React/Next.js)
- Mobile possible (Flutter)

## 9.2 Backend
- API gameplay
- Event logging anonymisé
- Scoring engine (Python)

## 9.3 IA
- LLM API (OpenAI / open source)
- Prompt instrumentation

## 9.4 Privacy by Design
- Pseudonymisation
- Differential Privacy
- Federated analytics (option future)

---

# 10. Modèle économique
## 10.1 Public
- Observatoire national / cantonal
- Subventions recherche et innovation

## 10.2 Privé
- Licences universités / écoles
- Corporate cognitive assessment (soft skills)
- Think tanks, consulting

---

# 11. Roadmap indicative
**Phase 1 (0–6 mois)**  
MVP scénario unique, IAS + IRP, dashboard simple.

**Phase 2 (6–18 mois)**  
Multiples scénarios, profils cognitifs, publication scientifique.

**Phase 3 (18–36 mois)**  
Observatoire public, longitudinal cohorts, policy dashboards.

---

# 12. Références & inspirations
- PISA (OECD)
- Programme for International Assessment of Adult Competencies (PIAAC)
- Serious Games in Public Policy (MIT, World Bank)
- Cognitive Load Theory (Sweller)
- Digital Attention Research (Microsoft, Stanford)
- AI-assisted cognition research (OpenAI, DeepMind, academia)

---

# 13. Positionnement narratif public
> **« Découvrez votre intelligence à l’âge de l’IA. Comment pensez-vous, planifiez-vous et collaborez-vous avec les machines ? »**

---

# 14. Notes pour contributeurs (GitHub)
- Ce projet est un **concept d’Observatoire Cognitif Populationnel (OCP)**.
- Le jeu est un instrument scientifique, pas un test psychométrique.
- Toute collecte de données doit respecter GDPR / LPD / ethics boards.
