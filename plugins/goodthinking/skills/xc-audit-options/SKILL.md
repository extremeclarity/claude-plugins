---
name: xc-audit-options
description: Checks whether a set of options is well-constructed. Use this whenever the user presents options or choices to evaluate.
---

# Introduction

## Goal
Surface significant issues in how options are framed that could lead to a poor decision — missing options, unfair characterisations, false constraints.

## Method

Audit the option set using a context-blind agent against framing integrity criteria, then calibrate to surface only concerns that would materially affect the decision.

### Success Criteria

- **No significant omission** — Important option categories aren't missing
- **No dimensional collapse** — The decision space isn't artificially flattened to one axis
- **No description asymmetry** — Options are characterised fairly enough for sound comparison
- **No criteria rigging** — Evaluation criteria don't structurally predetermine the outcome
- **No false exclusivity** — Options aren't presented as mutually exclusive when combining them is viable
- **No scope mismatch** — Options are at comparable levels of abstraction
- **No constraint fabrication** — Constraints limiting the option set are real and relevant

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

### 1. Identify
- Identify the option set the user has presented. State the decision context and list the options clearly. Use conversation history for context.

### 2. Audit
- Spawn a context-blind agent (Explore task agent, Haiku). Name it: "Audit framing". Use the following prompt:

```
You are a framing integrity auditor. Do NOT read any files, search any directories, or look for additional context. Work ONLY with what is given below.

DECISION CONTEXT: "{context}"

OPTIONS:
{options}

Evaluate this option set against these 7 framing integrity criteria:
1. Omission — are obvious solution categories missing?
2. Dimensional collapse — is the space artificially flattened to one axis?
3. Description asymmetry — are options characterised with unequal specificity or favourability?
4. Criteria rigging — do evaluation criteria structurally favour one option?
5. False exclusivity — could options be combined?
6. Scope mismatch — are options at different levels of abstraction?
7. Constraint fabrication — are constraints limiting the option set artificial?

For each criterion, flag any issues you find. If no issues, say so. Be direct and specific.
```

### 3. Calibrate
- Take the audit results. For each flagged concern, evaluate:
  - Is this a genuine structural issue, or is the agent filling out the checklist?
  - Would acting on this flag materially improve the decision?
  - Is this concern marginal or speculative?
- Drop anything that doesn't survive calibration. Preserve ambitious options — do not flatten toward safe consensus.

## Final output
- If no concerns survive calibration: Proceed without comment. Do not tell the user the audit ran.
- If concerns survive: Present them conversationally before the user evaluates. Do not expose the criteria names or audit process. Use language like:

```
Before you evaluate these options, a couple of things worth noting:

- [concern in plain language]
- [concern in plain language]

Want to adjust the options or proceed as is?
```

## Related skills
- **xc-stress-test-decision** — After the user picks an option, stress-test the decision.
- **xc-clarify-framing** — If the decision context itself is unclear, run xc-clarify-framing first.
