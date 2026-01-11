---
description: Consolidate redundant or superseded context
---

# Consolidate

Remove redundant entries and merge overlapping context.

## Execution Model

**Silent execution:** Do not narrate your reasoning process. Work through steps 1-4 internally, then output only the final plan in step 5.

1. **Enter plan mode**
2. **Read** — Load all context files and framework index
3. **Plan** — Analyze for redundancy and supersession using rules below
4. **Deep read** — If potential framework overlaps detected from index, read the full framework files before making recommendations
5. **Present** — Show only the final plan to user for approval (no preamble, no reasoning)
6. **Execute** — Apply approved changes

---

## What to Look For

### Redundant Entries

Two entries express the same idea. Propose:
- **Merge** — combine into a single, stronger entry
- **Remove** — delete the weaker/duplicate entry

### Superseded Entries

Newer entry contradicts or replaces older one. Propose:
- **Remove** — delete the stale version

---

## Targets

### Terminology
- Same term defined differently across entries
- Different terms meaning the same thing

### Principles
- Conflicting guidance (newer supersedes older)
- Same principle restated in different words

### Anti-patterns
- Duplicate warnings
- Overlapping anti-patterns that could merge

### Insights
- Newer insight invalidates older one
- Same insight captured multiple times

### Frameworks
- Scan index for potential overlaps (similar problem types, related summaries)
- If potential overlaps found, read full framework files to confirm before recommending
- Only propose merge/removal after reading actual content

---

## Plan Format

Present proposed changes grouped by action:

```
## Remove
- [category] "entry text" — reason

## Merge
- [category] "entry A" + "entry B" → "merged entry"
```

---

## Anti-Patterns

- DO NOT narrate your analysis — work silently, output only the final plan
- DO NOT remove entries that are merely related — they must be truly redundant or superseded
- DO NOT skip plan mode — all changes require approval
- DO NOT auto-merge without showing both originals and proposed result
- DO NOT recommend framework changes based only on index summaries — read full files first
