---
name: xc-brainstorm
description: Generates diverse solution ideas using parallel agents with different perspectives. Use this whenever the user is exploring solutions for a problem or goal.
---

# Introduction

## Goal
Generate a high volume of genuinely diverse solution ideas, then organise them into actionable themes.

## Method

Frame the problem as How Might We questions, spawn parallel context-blind agents with different diversity primes to generate ideas, then deduplicate and group into strategic themes.

### Success Criteria

- **Volume** — Many ideas per problem area
- **Diversity** — Different approaches, not variations of one
- **Problem-anchored** — Each idea addresses a specific HMW question
- **Actionable** — Concrete enough to evaluate
- **Novelty** — Not just restated existing solutions

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

### 1. Track progress
- Create a task list so the user can track progress:
  - Frame HMW questions and select primes
  - Confirm with user
  - Generate ideas (parallel agents)
  - Group ideas into themes

### 2. Frame
- From the user's problem or goal, generate How Might We questions:
  - One HMW per problem area (or group related areas)
  - Format: "How might we [action] so that [outcome]?"

### 3. Select primes
- Propose 2-4 diversity primes. Genuine diversity comes from different context or lenses:

| Type | Examples |
|------|----------|
| Context-based | No context (naive), full context (strategic) |
| Lens-based | Minimalist, enterprise, developer-focused, end-user-focused |

### 4. Confirm
- Present HMWs and primes to the user for approval. Stop and wait for confirmation before proceeding.

### 5. Generate
- For each prime, spawn a context-blind agent (Explore task agent, Haiku). Name each after its prime. Use the following prompt:

```
You are brainstorming solutions from a {prime} perspective. Do NOT read any files, search any directories, or look for additional context. Work ONLY with what is given below.

HMW QUESTIONS:
{hmw_questions}

Generate 8-10 solution ideas per HMW question. Be concrete and specific. Think from your assigned perspective — a {prime} thinker would approach this differently from other perspectives.
```

- Run all agents in parallel.

### 6. Combine
- Combine all ideas across agents into a single list.

## Final output
- Present the combined idea list to the user.
- Run the **xc-group-ideas** skill to organise the ideas into strategic themes.

## Related skills
- **xc-clarify-framing** — If the problem isn't clear, run xc-clarify-framing first.
- **xc-breakdown-problem** — If the problem is too large, break it down first and brainstorm per sub-part.
- **xc-group-ideas** — Always run after brainstorming to organise ideas into themes.
