# Worldview

Context persistence system for AI collaboration. Captures durable knowledge that survives across sessions.

## Installation

1. Open the plugin manager in Claude Code
   ```
   /plugin
   ```

2. Add the Extreme Clarity marketplace
   ```
   extremeclarity/claude-plugins
   ```

3. Install the Worldview plugin from the marketplace

4. Initialize in your project
   ```
   /worldview:setup
   ```

## Quick Start

```
/worldview:setup            # Initialize worldview in current project
/worldview:distill          # Promote knowledge from conversation to worldview
/worldview:consolidate      # Remove redundant or superseded context
/worldview:add-framework    # Save a thinking framework from conversation
/worldview:import-framework # Import frameworks from external files
```

## What It Does

Worldview builds persistent strategic context as your collaborate with AI. On each session start, worldview loads core context automatically. Claude uses this to:
- Align with your terminology
- Apply your principles when making recommendations
- Avoid known anti-patterns
- Treat validated insights as established facts
- Reference relevant frameworks when tackling problems

## Structure

```
.worldview/
├── terminology.txt      # Aligned terms with non-obvious meanings
├── principles.txt       # Beliefs, values, guidelines
├── anti-patterns.txt    # Approaches to avoid
├── insights.txt         # Validated discoveries
└── frameworks/
    ├── index.txt        # Framework summaries
    └── [name].md        # Full framework content
```

## How Context Flows

1. **Conversation** — Knowledge emerges through discussion
2. **Distill** — User runs `/worldview:distill` to promote durable knowledge
3. **Session Start** — Core context loads automatically on next session
4. **Application** — Claude uses context to inform responses

## Per-Project Configuration

Create `WORLDVIEW.md` in your project root to customize distill behavior. E.g:

```markdown
# Worldview Config

## Terminology
Only capture terms related to the domain model.

## Insights
This is a research project. Capture experimental findings even if tentative.
```

This file is optional. Distill reads it (if present) and applies overrides to default criteria.
