---
description: Save a reusable thinking framework from the conversation
---

# Add Framework

Create a reusable thinking framework from the current conversation.

## The Bar

**Only add frameworks that will clearly help in future sessions.**

Before creating a framework, ask:

1. **Reuse Test:** Will this framework be applied to similar problems in the future? If it's a one-off analysis, don't create a framework.

2. **Future Value Test:** Can you articulate a concrete future scenario where having this framework changes Claude's approach for the better?

3. **Structure Test:** Does it have clear structure (criteria, steps, matrix, model)? Vague advice doesn't make a framework.

---

## Process

1. **Review** — Look at the recent conversation for patterns, decision criteria, or mental models that emerged.

2. **Check for duplicates** — Read `.worldview/frameworks/index.txt`. If a similar framework exists, ask the user: update existing or create new?

3. **Align terminology** — Read `.worldview/terminology.txt`. Use consistent terms from the existing terminology.

4. **Write the framework** — Create `.worldview/frameworks/[framework-name].md` with:
   - Clear title
   - When to use this framework
   - The framework structure (criteria, steps, decision matrix, etc.)
   - Examples if helpful

   Use kebab-case for framework name (e.g., `decision-matrix.md`, `error-handling-patterns.md`).

5. **Update index** — Append to `.worldview/frameworks/index.txt`:
   ```
   [framework-name].md: One-line summary
   ```

6. **Extract terms** — If the framework introduces terms with non-obvious meanings, append to `.worldview/terminology.txt`:
   ```
   [YYYY-MM-DD] *Term*: Definition
   ```
   Apply the same bar: only add terms that will help Claude in future sessions.

## Guidelines

- Keep frameworks focused on a single problem type
- Use the user's language and framing where possible
- Reference existing terminology to maintain consistency
- Keep framework files concise — capture the structure, not exhaustive explanation
