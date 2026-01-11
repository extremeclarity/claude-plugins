---
description: Mine context from files/folders and propose structured imports
---

# Import Framework

Import frameworks from external files or folders, with supporting terminology and insights.

**Input:** File path or folder path (as argument)

## The Bar

**Only import what will clearly help in future sessions.**

Every import costs context space in every future session. Before proposing anything, ask:

1. **Future Value Test:** Will this meaningfully help Claude in future sessions on this project? If you can't articulate a concrete scenario, skip it.

2. **Relevance Test:** Does it connect to what this project is already about? Unrelated frameworks add noise.

3. **Uniqueness Test:** Is this already captured in the worldview, or is it general knowledge Claude already has?

---

## Step 0: Get Source Path

If no path was provided as an argument, **ask the user** for the file or folder path to import from. Do not guess or scan for files.

## Process

### 1. Read Source + Project Context

**Source:**
1. If path is a file: read the file
2. If path is a folder: use Glob to find `**/*.md` and `**/*.txt`, read all
3. If >2000 lines: warn user and recommend splitting

**Project context (for relevance checking):**
- `.worldview/terminology.txt`
- `.worldview/principles.txt`
- `.worldview/frameworks/index.txt` (index only, not full frameworks)

### 2. Detect Candidate Frameworks

Scan source for structured knowledge that could become frameworks:
- Decision trees / evaluation criteria
- Multi-step processes / workflows
- Mental models with clear structure
- Comparison matrices / trade-off analyses
- Causal models / diagnostic frameworks

For each candidate, apply the bar:
- **Duplicate check**: Does it already exist in frameworks index?
- **Relevance check**: Does it connect to project terminology, principles, or existing frameworks?
- **Future value check**: Will having this framework change Claude's approach in future sessions?

Skip anything that doesn't clearly pass all three.

### 3. Extract Supporting Items

For each candidate framework, extract:

**Terminology** — Terms central to that framework with non-obvious meanings
- Must be: Relevant to project, non-obvious, will help Claude in future sessions
- Format: `*Term*: Definition`
- Be selective — only terms that genuinely aid understanding

**Insights** — Empirical findings from that framework
- Must be: Empirical (not normative), project-specific, informative
- Format: One to two sentences max
- Be selective — only insights that change how we think about the project

**Note:** Principles and Anti-patterns are excluded from import — they should emerge through distill from conversation context.

### 4. Present Import Plan

**Output ONLY the import plan below — no preamble, no thinking, no commentary.**

```markdown
## Import Plan

**Source:** [path] ([X files, Y lines])

### Proposed Frameworks

1. **framework-name.md** — One-line purpose
   Why: Brief reasoning on relevance to project
   Terms: *Term1*, *Term2*

2. **another-framework.md** — One-line purpose
   Why: Brief reasoning on relevance
   Terms: (none)

### Skipped

- **skipped-framework.md** — reason (e.g., "not relevant to project", "duplicate", "no clear future value")
```

**Guidelines:**
- Keep framework descriptions to ONE line
- "Why" must reference project relevance — connect to existing terminology, principles, or frameworks
- Only list terminology if the framework introduces terms with non-obvious meanings
- Show skipped frameworks with brief reason
- Err on the side of skipping — quality over quantity

**STOP and WAIT for user approval.**

### 5. Execute Approved Imports

On user approval:

1. **Read schema**: Load `scripts/context-schema.json` to get locations and formats
2. **Frameworks**: For each approved framework:
   - Create `.worldview/frameworks/[framework-name].md` (use kebab-case)
   - Append to index: `[framework-name].md: One-line summary`
3. **Terminology**: Append terms using schema's `Terminology.location` and `lineFormat`
4. **Insights**: Append insights using schema's `Insights.location` and `lineFormat`
5. **Report summary**:
   ```
   ## Import Complete

   - frameworks: +N
   - terminology.txt: +N terms
   - insights.txt: +N insights

   Total: X items imported from [source]
   ```

## Edge Cases

- **Few/no relevant frameworks found**: This is fine — report what was skipped and why
- **All duplicates**: Report "All frameworks already exist or don't pass the bar"
- **User removes all items**: Report "No items approved for import"
- **Path not found**: Report error and stop
