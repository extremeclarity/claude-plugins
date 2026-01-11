---
description: Distill session knowledge to stable context
---

# Distill

Promote durable knowledge from conversation to worldview.

## Execution Model

**Silent execution:** Do not narrate your reasoning process. Work through steps 1-3 internally, then output only the final plan in step 4.

1. **Enter plan mode**
2. **Read** — Load `${CLAUDE_PLUGIN_ROOT}/scripts/context-schema.json` and all context files. Also read `WORLDVIEW.md` if it exists.
3. **Plan** — Generate proposed changes using distill rules below (with any WORLDVIEW.md overrides applied). Validate against criteria.
4. **Present** — Show only the final plan to user for approval (no preamble, no reasoning)
5. **Execute** — Apply approved changes

## The Bar

**When in doubt, don't promote.**

Every addition costs context space in every future session. Before promoting anything, ask:

1. **Future Value Test:** Will this meaningfully help Claude in future sessions? If you can't articulate a concrete scenario where this knowledge changes Claude's behavior for the better, don't add it.

2. **Conceptual Test:** Would this still matter if we completely changed the tech stack? Core knowledge is about WHAT to build and WHY — not implementation details, tool behaviors, or coding patterns.

3. **Uniqueness Test:** Is this already captured elsewhere, or is it general knowledge Claude already has? Don't duplicate.

---

## Project Overrides (WORLDVIEW.md)

If `WORLDVIEW.md` exists, it contains project-specific guidance that **overrides or refines** the default criteria below. Read it first and apply its instructions when evaluating promotions.

Common overrides:
- Redefining what a category means for this project
- Stricter or looser promotion bars
- Focus areas to prioritize or ignore

---

## Promotion Criteria

### → Terminology
- **Conceptual**: About problem space, users, product — NOT technical/implementation terms
- **Recurrent**: Term appears multiple times across conversations
- **Relevant**: High relevance to project direction
- **Non-obvious**: Meaning differs from common usage or is project-specific

### → Principles
- **Conceptual**: About how to think, work, decide — NOT coding style or tool preferences
- **Explicit**: User stated it directly, not inferred
- **Actionable**: Specific enough to guide future decisions
- **Durable**: Likely to remain true for project lifetime
- **Concise**: One sentence. If it takes a paragraph to explain, it's not crisp enough.

### → Anti-patterns
- **Conceptual**: Wrong problem framing, misaligned assumptions — NOT code smells or tool misuse
- **Specific**: Clear enough to recognize and avoid
- **Recurring risk**: Likely to be attempted again without warning
- **Concise**: One sentence. State what to avoid and why, nothing more.

### → Insights
- **Conceptual**: About problem space, users, product — NOT tool behaviors or API quirks
- **Empirical**: Observed or discovered, not hypothesized
- **Project-specific**: Not general knowledge available elsewhere
- **Informative**: Changes how we think about the project
- **Concise**: One to two sentences max. Capture the insight, not the reasoning behind it.

---

## Distill Rules

### Scan for Terminology

**Scan:** All `.worldview/*.txt` files
**Target:** `.worldview/terminology.txt`

Look for terms with non-obvious meanings not yet defined.

### Review Recent Conversation

**Source:** Conversation history

Scan for emergent knowledge not explicitly captured:

| Look for | Target |
|----------|--------|
| Terms with non-obvious meanings | Terminology |
| Beliefs, values, guidelines expressed | Principles |
| Approaches ruled out | Anti-patterns |
| Validated empirical findings | Insights |

## Anti-Patterns

- DO NOT narrate your analysis — work silently, output only the final plan
- DO NOT add something just because it came up in conversation — apply the bar
- DO NOT skip plan mode — all changes require approval
