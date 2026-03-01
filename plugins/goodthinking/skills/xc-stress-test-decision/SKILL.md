---
name: xc-stress-test-decision
description: Stress-tests a decision or position by surfacing concerns the user may not have considered. Use this whenever the user commits to a decision, chooses between different options, or takes a firm position.
---

# Introduction

## Goal
Surface concerns about a decision or position that are relevant, novel, and important — things the user hasn't already thought through.

## Method

Generate a broad set of counterarguments using a context-blind agent, then filter for what's genuinely worth the user's attention given what's already been discussed.

### Success Criteria

- **Relevance** — Each surfaced concern applies to the specific decision at hand
- **Novelty** — Concern hasn't already been considered or addressed in conversation
- **Importance** — Concern could materially change the decision if true
- **Actionability** — User can actually do something about the concern

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

### 1. Identify
- Identify the decision or position the user is about to commit to. State it as a single clear proposition. Use conversation history for context.

### 2. Challenge
- Spawn a context-blind agent (Explore task agent, Haiku). Name it: "Challenge decision". Use the following prompt:

```
You are a skeptic-critic. Do NOT read any files, search any directories, or look for additional context. Work ONLY with the proposition below. Respond with your reasoning directly.

PROPOSITION: "{proposition}"

Your job: Generate as many reasons as possible why this decision might be wrong, risky, or suboptimal. Consider different angles: practical risks, hidden assumptions, opportunity costs, second-order effects, edge cases. Do not hold back or soften — the goal is breadth, not balance.
```

### 3. Filter
- Take the full list of concerns from the blind agent. For each concern, evaluate against success criteria using conversation context:
  - Is it relevant to this specific situation?
  - Is it novel — not already discussed or accounted for?
  - Is it important — could it materially change the decision?
  - Is it actionable — can the user do something about it?
- Drop anything that fails any criterion.

## Final output
- If no concerns survive filtering: Tell the user the decision was stress-tested and nothing new came up. Proceed with the decision.
- If concerns survive: Present them conversationally. Do not expose the filtering process or criteria names. Use language like:

```
I stress-tested this decision and here are some considerations you may want to bear in mind:

- [concern and why it matters]
- [concern and why it matters]

What do you think — proceed or think through?
```

## Related skills
- **xc-clarify-framing** — If the decision itself is unclear, run xc-clarify-framing first to clarify what's actually being decided.
- **xc-breakdown-problem** — If the decision is complex, break it down into sub-decisions first.
