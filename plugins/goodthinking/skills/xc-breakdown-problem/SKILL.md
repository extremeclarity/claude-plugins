---
name: xc-breakdown-problem
description: Breaks problems and goals into independent parts that can be tackled separately. Use this whenever the user states a problem or goal that has multiple dimensions or parts.
---

# Introduction

## Goal
Break a complex problem or goal into sub-parts for clearer understanding. Focus on what the problem IS, not how to solve it.

## Method

Propose a breakdown, then iteratively validate and refine using a context-blind agent until success criteria are met. Expect multiple passes.

### Success Criteria

- **MECE** — Sub-parts are mutually exclusive and collectively exhaustive
- **Uniformity** — Sub-parts are at the same level of abstraction
- **Precision** — Each sub-part is well-defined
- **Problem-focused** — Sub-parts describe problems or goals, not solutions
- **Actionable** — Each sub-part can be worked on independently

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

- Across all steps, focus on what the problem or goal IS, not how to solve it.

### 1. Propose breakdown
- Think about the problem or goal the user has shared. Use conversation history for relevant details and clues. Do not look for additional context in files or memory.
- Propose a breakdown into sub-parts. Self-critique against the success criteria. Describe what you observe, not why it happens — stay far from causal or solution framing.

### 2. Validate
- Spawn a context-blind agent (Haiku task agent). Name it: "Validate breakdown". Provide the agent with the original problem/goal and your proposed breakdown. Ask the agent to validate against the success criteria and surface any gaps or inconsistencies.

### 3. Revise
- If the validator surfaced issues, revise the breakdown. Make the smallest changes that address the issues. Preserve the structure of the original breakdown. Do NOT rewrite from scratch.
- Send the revised breakdown back to the validator (step 2). Repeat until the validator passes all success criteria.

## Final output
- Present breakdown: Present the sub-parts to the user naturally in conversation. For each sub-part, provide a brief description of what it covers.
- Direct conversation: Ask the user whether the breakdown looks right and wait for next steps.

## Related skills
- **xc-clarify-framing** — If the problem or goal is ambiguous, run xc-clarify-framing first to clarify before decomposing.
