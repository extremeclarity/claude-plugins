---
name: xc-group-ideas
description: Consolidates ideas into strategic themes by deduplicating and grouping. Use this whenever a list of ideas emerges from the conversation that could benefit from organising.
---

# Introduction

## Goal
Turn a messy set of ideas into a clear, structured set of themes that can be evaluated independently.

## Method

Deduplicate, cluster, and name strategic themes. Validate against success criteria.

### Success Criteria

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

### 1. Deduplicate
- Identify duplicate or near-duplicate ideas across all inputs.
- Merge duplicates into single representative ideas.

### 2. Cluster
- Group similar ideas together.
- Name each group descriptively.

### 3. Theme
- Cluster groups into strategic themes (maximum 7):
  - Identify which groups belong together at a higher abstraction
  - Name each theme strategically
  - Define a brief strategic intent for each theme

### 4. Validate
- Check against success criteria. If themes fail, revise before presenting.

## Final output
- Present themed groups to the user:
  - Each theme with its strategic intent
  - Ideas within each theme
  - Key deduplication decisions made

## Related skills
- **xc-brainstorm** — If the user needs to generate ideas first, run xc-brainstorm (which runs xc-group-ideas automatically after).
