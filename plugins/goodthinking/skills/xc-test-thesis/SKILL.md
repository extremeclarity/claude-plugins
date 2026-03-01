---
name: xc-test-thesis
description: Tests whether a thesis or hypothesis holds up under adversarial scrutiny. Use this when the user is doing strategic planning and has a thesis or hypothesis they want to evaluate for robustness.
---

# Introduction

## Goal
Determine what's defensible, what's contested, and what falls apart in a thesis or belief the user holds.

## Method

Two context-blind agents analyse the thesis in parallel — one builds the strongest case FOR, one finds the strongest case AGAINST. They exchange findings and refine. The main agent synthesises into a defensibility spectrum.

### Success Criteria

- **Adversarial rigour** — Both sides present their strongest case, not a balanced summary
- **Evidence-grounded** — Claims are tied to specific reasoning or evidence, not vague assertions
- **Calibrated** — The spectrum distinguishes what's solid from what's contested from what's unsupported
- **Actionable** — The user can see what to trust, what to investigate, and what to discard

## Part 1: Evaluate

- Think about whether this skill actually applies to the current situation. If it doesn't, skip silently and move on.
- If it does, suggest it to the user conversationally. Briefly explain why you think it's relevant. Wait for confirmation before proceeding.

## Part 2: Workflow

### 1. Track progress
- Create a task list so the user can track progress:
  - Confirm thesis and source material
  - Parallel analysis (Analyst + Skeptic)
  - Exchange and refine
  - Synthesise and present

### 2. Confirm thesis
- State the thesis clearly and ask the user to confirm it. Also confirm what source material to work from (conversation context, specific files, or both). Wait for confirmation before proceeding.

### 3. Parallel analysis
- Spawn two context-blind agents in parallel (Explore task agents, Opus). Use the following prompts:

**Analyst agent** (name: "Analyst — build case FOR"):
```
You are the ANALYST in an adversarial thesis test. Do NOT read any files, search any directories, or look for additional context unless source files are specified below.

THESIS: "{thesis}"
SOURCE MATERIAL: {source_material}

Your job: Build the STRONGEST possible case FOR this thesis.
- Extract every piece of supporting evidence
- Identify patterns and logical inferences that validate the thesis
- Prioritise by strength of evidence

Output a structured report:
1. Key supporting evidence (with specific references where available)
2. Logical chain of reasoning
3. Confidence assessment — what's rock-solid vs what's interpretive
```

**Skeptic agent** (name: "Skeptic — build case AGAINST"):
```
You are the SKEPTIC in an adversarial thesis test. Do NOT read any files, search any directories, or look for additional context unless source files are specified below.

THESIS: "{thesis}"
SOURCE MATERIAL: {source_material}

Your job: Find the STRONGEST case AGAINST this thesis.
- Find contradictory evidence the Analyst might overlook
- Propose alternative readings of any evidence that could support the thesis
- Identify missing context, logical gaps, or unstated assumptions

Output a structured report:
1. Counter-evidence (with specific references where available)
2. Alternative interpretations of key evidence
3. Logical weaknesses in the thesis
4. What would need to be true for this thesis to hold?
```

### 4. Exchange
- Resume each agent, showing them the other's findings. Run in parallel:

**Resume Analyst:**
```
The Skeptic produced this counter-analysis:

{skeptic_report}

Refine your position:
- Address their strongest counter-points
- Concede what you must
- Strengthen what survives
```

**Resume Skeptic:**
```
The Analyst produced this supporting analysis:

{analyst_report}

Refine your position:
- Address their strongest evidence
- Identify what you cannot defeat
- Sharpen your remaining critiques
```

### 5. Synthesise
- Using both agents' refined reports, create the defensibility spectrum.

## Final output

Present the spectrum to the user:

```
## Thesis Test: {thesis}

### Solid ground
Evidence and reasoning that both sides agree on.

### Contested
Claims where both sides found plausible but competing evidence or interpretations.
[For each: what the analyst says, what the skeptic says, and which way it leans]

### Unsupported
Claims that were either debunked with counter-evidence, had no grounding, or relied on unstated assumptions.

### Refined thesis
A revised version of the thesis incorporating only what survived scrutiny.

### Open questions
What remains uncertain and would need further investigation.
```

## Related skills
- **xc-stress-test-decision** — For testing a specific decision or choice rather than a belief or thesis.
- **xc-clarify-framing** — If the thesis itself is vague, clarify it first.
