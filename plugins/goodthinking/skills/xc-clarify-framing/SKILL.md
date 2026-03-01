---
name: xc-clarify-framing
description: Sharpens problem and goal statements to be more precise, unambiguous, complete, and well-scoped. Use this whenever the user states a problem or goal, so that you're fully aligned on what they want to achieve.
---

# Introduction

## Goal
Understand and clarify what the user's goal or problem IS, not how to solve it.

## Method

Focus the conversation on clarifying the user's problem or goal until success criteria are met.

### Success Criteria

- **Precision** — Terms are accurate and specific
- **Clarity** — Single, clear interpretation
- **Completeness** — Full picture captured from available information
- **Scope** — Boundaries are neither too broad nor too narrow

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

- Across all stages, focus on what the user wants to achieve, not how to achieve it.

### 1. Evaluate
- Think about what the user wants to achieve. Use conversation history to look for relevant details and clues. Do not look for additional context in files or memory. Frame the problem or goal concisely in one paragraph or less.
- Spawn a new context-blind agent (Haiku task agent). Name it: "Evaluate framing". Ensure no file access allowed and prompt it not to look for additional context in files or memory. Ask the agent whether your framing meets success criteria or if there are any practical gaps. A practical gap is one that makes the problem or goal unclear to anyone who has no prior context. If no gaps exist, skip to final output and present the framing to the user. Otherwise continue to the next step.

### 2. Clarify
- Ask the user clarifying questions that will help you close gaps in your framing and meet success criteria. If asking more than one question, use the question tool.

### 3. Revise
- Revise your framing based on answers provided by the user. Make the smallest changes that address the challenges. Preserve the structure of the original framing. Do NOT rewrite from scratch or invent new frameworks.

### 4. Abstract
- Spawn a new context-blind agent (Opus task agent). Name it: "Check abstraction". Ensure no file access allowed and prompt it not to look for additional context in files or memory. Give it the revised problem statement and success criteria. Ask it to:
  1. Start with the problem statement
  2. Ask "why" questions to think of more abstract problem statements
  3. Ask "how" questions to think of more concrete problem statements
  4. Respond with 2-3 alternative problem statements at different levels of abstraction that meet success criteria
- Evaluate the alternatives. Independently check each against success criteria. If a promising alternative opens a better solution space than the current framing, fold it into the final output as an alternative framing. Otherwise, proceed with the original.

## Final output
- Present the framing: Present the sharpened problem or goal statement to the user naturally in conversation.
- If abstraction surfaced a promising alternative, present it alongside the primary framing with a brief note on what each level opens up. Let the user choose.
- Direct conversation: If the problem or goal remains ambiguous, gently direct the conversation towards key areas of ambiguity. Otherwise, nudge the user for confirmation of the framing and wait for next steps.

## Related skills
- **xc-breakdown-problem** — If the problem or goal is complex, suggest running xc-breakdown-problem to split it into independent parts.
