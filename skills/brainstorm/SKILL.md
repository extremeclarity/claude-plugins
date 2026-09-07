---
name: brainstorm
description: Generates diverse solution ideas using parallel agents with different perspectives.
---

# Introduction

## Goal
Generate a high volume of genuinely diverse solution ideas, then organise them into actionable themes.

## Method

Frame the problem as How Might We questions, spawn parallel agents with different diversity primes to generate ideas, then deduplicate and group into strategic themes. Each prime is either context-blind (for divergent thinking) or context-aware (for grounded thinking), decided by the orchestrator based on whether the prime benefits from knowing project reality.

### Success Criteria

- **Volume** — Many ideas per problem area
- **Diversity** — Different approaches, not variations of one
- **Problem-anchored** — Each idea addresses a specific HMW question
- **Actionable** — Concrete enough to evaluate
- **Novelty** — Not just restated existing solutions

## Workflow

### 1. Track progress
- Create a task list so the user can track progress:
  - Frame HMW questions and select primes (with context visibility)
  - Confirm with user
  - Gather context for context-aware primes
  - Generate ideas (parallel agents)
  - Build on ideas across agents
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
| Analogy-based | Far-field (how unrelated domains solve the same underlying structure) |

- For each prime, decide **context visibility**:
  - **Context-blind** — primes that derive value from *not knowing* (naive, outsider, cross-domain, minimalist). Ignorance of current reality is the feature.
  - **Context-aware** — primes that derive value from *grounding in reality* (developer-focused, pragmatist, strategic, enterprise). Without project context, these primes produce generic ideas indistinguishable from blind ones.
- For each context-aware prime, identify **what context to gather** — relevant files, architecture patterns, existing implementations, constraints, or conventions. Be specific (e.g., "read src/auth/ to understand current auth flow") rather than gathering everything.

### 4. Confirm
- Present HMWs and primes to the user for approval, including context visibility per prime:
  - Prime A (context-blind) — why blindness helps this perspective
  - Prime B (context-aware: brief description of what context) — why grounding helps this perspective
- Stop and wait for confirmation before proceeding.

### 5. Gather context
- If any primes are context-aware, gather the identified context now — read relevant files, explore relevant parts of the codebase. Use an Explore Agent to do this if necessary.  
- Prepare a focused context summary for each context-aware prime. Keep it concise — enough to ground ideation, not so much that it overwhelms the agent's focus.
- Skip this step if all primes are context-blind.

### 6. Generate
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

### 7. Build on
- Pick the 2-3 strongest ideas from each agent. Resume every agent with the strongest ideas from the other agents. Ask it to build on or combine them from its own perspective and produce 2-3 improved or hybrid ideas. Run the resumes in parallel.

### 8. Combine
- Combine all ideas from both rounds into a single list.

## Final output
- Present the combined idea list to the user.
- Run the **group-ideas** skill to organise the ideas into strategic themes.

## Related skills
- **clarify-framing** — If the problem isn't clear, run clarify-framing first.
- **breakdown-problem** — If the problem is too large, break it down first and brainstorm per sub-part.
- **group-ideas** — Always run after brainstorming to organise ideas into themes.
