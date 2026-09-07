---
name: brainstorm
description: Generates diverse solution ideas using parallel agents with different perspectives.
---

# Introduction

## Goal
Generate a high volume of genuinely diverse solution ideas, then organise them into actionable themes.

## Method

Frame the problem as How Might We questions, spawn parallel agents with different diversity primes, then deduplicate and group the ideas inline. Each prime is either context-blind (for divergent thinking) or context-aware (for grounded thinking). The whole workflow runs in a single pass. The user sees nothing until the final themed output.

### Success Criteria

- **Volume** — Many ideas per problem area
- **Diversity** — Different approaches, not variations of one
- **Problem-anchored** — Each idea addresses a specific HMW question
- **Actionable** — Concrete enough to evaluate
- **Novelty** — Not just restated existing solutions

## Workflow

### 1. Frame
- From the user's problem or goal, generate How Might We questions:
  - One HMW per problem area (or group related areas)
  - Format: "How might we [action] so that [outcome]?"

### 2. Select primes
- Pick 2 primes. One context-blind, one context-aware. Use more only when the user asks for extra breadth. Genuine diversity comes from different context or lenses:

| Type | Examples |
|------|----------|
| Context-based | No context (naive), full context (strategic) |
| Lens-based | Minimalist, enterprise, developer-focused, end-user-focused |
| Analogy-based | Far-field (how unrelated domains solve the same underlying structure) |

- **Context-blind** primes derive value from not knowing (naive, outsider, cross-domain, minimalist, far-field). Ignorance of current reality is the feature.
- **Context-aware** primes derive value from grounding in reality (developer-focused, pragmatist, strategic, enterprise). Without project context they produce generic ideas.
- For each context-aware prime, identify what context to gather. Be specific (e.g., "read src/auth/ to understand current auth flow") rather than gathering everything.

### 3. Gather context
- Gather the identified context for context-aware primes. Read the few files that matter directly. Use an Explore agent only when the relevant context is too large to read directly.
- Skip this step if all primes are context-blind.

### 4. Generate
- For each prime, spawn a blind-reasoner agent (Haiku). Name each after its prime.

**Context-blind prompt:**
```
You are brainstorming solutions from a {prime} perspective. Work ONLY with what is given below.

HMW QUESTIONS:
{hmw_questions}

Generate 5 solution ideas per HMW question. Be concrete and specific. Think from your assigned perspective — a {prime} thinker would approach this differently from other perspectives.
```

**Context-aware prompt:**
```
You are brainstorming solutions from a {prime} perspective. Work ONLY with what is given below.

PROJECT CONTEXT:
{gathered_context}

HMW QUESTIONS:
{hmw_questions}

Generate 5 solution ideas per HMW question. Be concrete and specific. Think from your assigned perspective — a {prime} thinker would approach this differently from other perspectives. Use the project context to ground your ideas in what actually exists, but don't limit yourself to incremental improvements.
```

- Run all agents in parallel.

### 5. Synthesise
- This step runs inline. Spawn no further agents.
- Merge duplicate and near-duplicate ideas across agents.
- Where two ideas from different agents combine into something stronger, add the hybrid.
- Group the ideas into at most 7 themes by the dimension of the problem each addresses. Avoid grouping by surface similarity.

## Final output
- Present a single message. The HMW questions, one line on the primes used, and the ideas grouped by theme.
- If the user wants more, offer a build-on round (resume each generator with the other agents' strongest ideas) or a full group-ideas pass. Run these only on request.

## Related skills
- **clarify-framing** — If the problem isn't clear, run clarify-framing first.
- **breakdown-problem** — If the problem is too large, break it down first and brainstorm per sub-part.
- **group-ideas** — For a more rigorous grouping than the inline pass.
