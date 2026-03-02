---
name: xc-group-ideas
description: Consolidates ideas into strategic themes by deduplicating and grouping. Use this whenever a list of ideas emerges from the conversation that could benefit from organising.
---

# Introduction

## Goal
Turn a messy set of ideas into a clear, structured set of themes that can be evaluated independently.

## Method

Deduplicate ideas, then explore the space of possible groupings from two perspectives — one grounded in actual ideas, one grounded in the problem's natural dimensions. Select the best grouping against success criteria, using the problem-grounded grouping as a north star.

### Success Criteria

- **Problem-framed** — Themes describe dimensions of the problem, not categories of solutions
- **Completeness** — All ideas accounted for
- **MECE** — Themes are mutually exclusive and collectively exhaustive
- **Uniformity** — Themes at the same level of abstraction
- **Simplicity** — Easy to classify any idea into its theme
- **Actionable** — Each theme can be evaluated or prioritised independently
- **Maximum 7 themes** — Fewer is better. Force hard choices.

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

### 1. Track progress
- Create a task list so the user can track progress:
  - Deduplicate ideas
  - Generate theme candidates
  - Generate problem-space themes
  - Select best grouping
  - Present results

### 2. Deduplicate
- Identify duplicate or near-duplicate ideas across all inputs.
- Merge duplicates into single representative ideas.

### 3. Generate theme candidates
- Generate 3 different ways to group the deduplicated ideas. For each grouping, use a different organizing principle.
- Group by what dimension of the problem each idea addresses, not by what the ideas look like. Avoid surface-similarity clustering (e.g., "API solutions", "UI solutions"). Instead aim for problem dimensions (e.g., "reduce friction", "increase trust").
- For each grouping, explicitly state the organizing principle (what question does this grouping answer?) and why it's useful for this problem.
- Do not evaluate against success criteria — the goal is to explore different organizing principles, not to converge.
- Show the user each grouping in this format:

```
**Grouping [N] — [organizing principle as a question]**
[Why this principle is useful for this problem — one line]
```

### 4. Generate problem-space themes
- Spawn a context-blind agent (Haiku task agent). Name it: "Problem-space theme design". Use the following prompt:

```
You are designing themes to organise solutions for a problem. Do NOT read any files, search any directories, or look for additional context. Work ONLY with the problem description below. You will NOT see the actual solutions — this is intentional.

PROBLEM: "{problem_description}"

Design 2-3 different ways to group solutions to this problem into strategic themes (maximum 7 themes per grouping). Each grouping should use a different organizing principle.

Group by the problem's natural dimensions — what aspects of the problem do solutions address? Do NOT group by what solutions might look like (e.g., avoid "technical solutions" or "process solutions"). Instead think about what parts of the problem need solving (e.g., "visibility gap", "trust deficit", "coordination overhead").

For each grouping, state:
- The organizing principle as a question (e.g., "Where in the lifecycle does the problem occur?")
- Why this organizing principle is useful for this problem
- Theme names with a one-line strategic intent per theme
```

- Show the user each grouping in the same format as step 3 (organizing principle + reasoning only).

### 5. Select best grouping
- This step runs silently.
- Spawn an Opus task agent. Name it: "Select best grouping". Pass it all groupings from steps 3 and 4, the deduplicated ideas, and the success criteria. Use the following prompt:

```
You are selecting the best theme grouping for a set of ideas. You have groupings from two sources — some designed with knowledge of the actual ideas, some designed from the problem description alone without seeing ideas.

GROUPINGS DESIGNED WITH KNOWLEDGE OF IDEAS:
{idea_aware_groupings}

GROUPINGS DESIGNED FROM THE PROBLEM ALONE:
{problem_space_groupings}

IDEAS TO BE GROUPED:
{deduplicated_ideas}

SUCCESS CRITERIA:
- Problem-framed — Themes describe dimensions of the problem, not categories of solutions
- Completeness — All ideas accounted for
- MECE — Themes are mutually exclusive and collectively exhaustive
- Uniformity — Themes at the same level of abstraction
- Simplicity — Easy to classify any idea into its theme
- Actionable — Each theme can be evaluated or prioritised independently
- Maximum 7 themes — Fewer is better

Follow these steps in order:

STEP 1: Does any problem-only grouping meet ALL success criteria, including accommodating all ideas? If yes — select it and stop. Explain why it works.

STEP 2: If no problem-only grouping accommodates all ideas, identify the best problem-only grouping — the one that meets the most success criteria aside from completeness. This is the north star.

STEP 3: Which idea-aware groupings meet all success criteria? Of those, which is closest to the north star — i.e., which best preserves the problem-space framing and strategic perspective of the north star grouping?

STEP 4: Select that grouping. Assign every idea to a theme. Flag any ideas that were difficult to place.

Output: The selected grouping with themes, strategic intents, ideas assigned to each theme, and any difficult placements noted.
```

## Final output

Present the selected grouping to the user in this format:

```
## [Problem] — Grouped by [organizing principle]

| Theme | Description | Ideas |
|-------|-------------|-------|
| [Theme name] | [Strategic intent] | [Idea 1], [Idea 2], ... |
| [Theme name] | [Strategic intent] | [Idea 1], [Idea 2], ... |
| ... | ... | ... |

**Deduplication:** [Any merges made, or "None"]
**Notes:** [Any difficult placements, briefly]
```

## Related skills
- **xc-brainstorm** — If the user needs to generate ideas first, run xc-brainstorm (which runs xc-group-ideas automatically after).
