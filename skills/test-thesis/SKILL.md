---
name: test-thesis
description: Tests whether a thesis or hypothesis holds up under adversarial scrutiny.
---

# Introduction

## Goal
Determine what's defensible, what's contested, and what falls apart in a thesis or belief the user holds.

## Method

Two context-blind agents analyse the thesis in parallel — one builds the strongest case FOR, one finds the strongest case AGAINST. They exchange findings and refine. The main agent synthesises into a defensibility spectrum.

## Workflow

### 1. Track progress
- Create a task list so the user can track progress:
  - Confirm thesis and source material
  - Parallel analysis (Analyst + Skeptic)
  - Exchange and refine
  - Synthesise and present

### 2. Confirm thesis
- State the thesis clearly and ask the user to confirm it. Also confirm what source material to work from (conversation context, specific files, or both). Wait for confirmation before proceeding.

### 3. Parallel analysis
- Spawn two agents in parallel (Opus) using the prompts below. Use blind-reasoner agents when the source material is conversation context only. Use general-purpose agents when source files are specified, so they can read those files. The prompts instruct them to read nothing else.

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
- State the evidence that would change your mind (your cruxes)
```

**Resume Skeptic:**
```
The Analyst produced this supporting analysis:

{analyst_report}

Refine your position:
- Address their strongest evidence
- Identify what you cannot defeat
- Sharpen your remaining critiques
- State the evidence that would change your mind (your cruxes)
```

### 5. Synthesise
- Using both agents' refined reports, create the defensibility spectrum.
- Weigh evidence by what it discriminates between. Evidence consistent with both positions discriminates nothing and should carry no weight.
- Express confidence as rough probabilities rather than hedge words.

## Final output

Present the spectrum to the user:

```
## Thesis Test: {thesis}

### Solid ground
Evidence and reasoning that both sides agree on.

### Contested
Claims where both sides found plausible but competing evidence or interpretations.
[For each: what the analyst says, what the skeptic says, which way it leans, and what evidence would settle it]

### Unsupported
Claims that were either debunked with counter-evidence, had no grounding, or relied on unstated assumptions.

### Refined thesis
A revised version of the thesis incorporating only what survived scrutiny.

### Open questions
The cruxes. The evidence that would most shift the assessment if it appeared, ordered by impact.
```

## Related skills
- **stress-test-decision** — For testing a specific decision or choice rather than a belief or thesis.
- **clarify-framing** — If the thesis itself is vague, clarify it first.
