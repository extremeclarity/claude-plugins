---
name: stress-test-decision
description: Stress-tests a decision or position by surfacing concerns the user may not have considered.
---

# Introduction

## Goal
Surface concerns about a decision or position that are relevant, novel, and important — things the user hasn't already thought through.

## Method

Run a premortem on the decision using a context-blind agent. The agent assumes the decision already failed and explains why. Assumed failure produces more specific and more numerous causes than hypothetical doubt. Then filter for what's genuinely worth the user's attention given what's already been discussed.

### Success Criteria

- **Relevance** — Each surfaced concern applies to the specific decision at hand
- **Novelty** — Concern hasn't already been considered or addressed in conversation
- **Importance** — Concern could materially change the decision if true
- **Actionability** — User can actually do something about the concern

## Workflow

### 1. Identify
- Identify the decision or position the user is about to commit to. State it as a single clear proposition. Use conversation history for context.

### 2. Premortem
- Spawn a context-blind agent (Explore task agent, Haiku). Name it: "Premortem". Use the following prompt:

```
You are running a premortem. Do NOT read any files, search any directories, or look for additional context. Work ONLY with the proposition below. Respond with your reasoning directly.

PROPOSITION: "{proposition}"

Imagine it is one year later. This decision was carried out and it failed badly. The failure is a fact. Your job is to explain it, not to question whether it happened.

Write the history of the failure as a list of distinct causes. For each cause, describe concretely how the failure unfolded. Cover different angles: practical risks, hidden assumptions, opportunity costs, second-order effects, edge cases. Do not hold back or soften — the goal is breadth, not balance.
```

### 3. Filter
- Take the full list of concerns from the blind agent. For each concern, evaluate against success criteria using conversation context:
  - Is it relevant to this specific situation?
  - Is it novel — not already discussed or accounted for?
  - Is it important — could it materially change the decision?
  - Is it actionable — can the user do something about it?
- Drop anything that fails any criterion.
- Order the surviving concerns by how severe the failure would be and how likely it seems. Most severe and likely first.

## Final output
- If no concerns survive filtering: Tell the user the decision was stress-tested and nothing new came up. Proceed with the decision.
- If concerns survive: Present them conversationally. Do not expose the filtering process or criteria names. Use language like:

```
I stress-tested this decision and here are some considerations you may want to bear in mind:

- [concern and why it matters]
- [concern and why it matters]

What do you think — proceed or think through?
```

- Where a surviving concern hinges on a future uncertainty, suggest a tripwire alongside it. A tripwire is a concrete observable condition that should trigger revisiting the decision.

## Related skills
- **clarify-framing** — If the decision itself is unclear, run clarify-framing first to clarify what's actually being decided.
- **breakdown-problem** — If the decision is complex, break it down into sub-decisions first.
