# Worldview

Context persistence system for AI collaboration. Captures durable knowledge that survives across sessions.

## Installation

```
/plugin marketplace add extremeclarity/claude-plugins
/plugin install worldview@extremeclarity
```

For local development:
```bash
claude --plugin-dir /path/to/plugins/worldview
```

## Quick Start

```
/worldview:setup            # Initialize worldview in current project
/worldview:distill          # Promote knowledge from conversation to worldview
/worldview:add-framework    # Save a thinking framework from conversation
/worldview:import-framework # Import frameworks from external files
```

## What It Does

Worldview stores what you learn about a project over time — terminology, principles, insights, frameworks — so future sessions start with accumulated context rather than from scratch.

On each session start, worldview loads core context automatically. Claude uses this to:
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
3. **SessionStart** — Core context loads automatically on next session
4. **Application** — Claude uses context to inform responses

## Per-Project Configuration

Create `WORLDVIEW.md` in your project root to customize distill behavior:

```markdown
# Worldview Config

## Terminology
Only capture terms related to the domain model.

## Principles
Apply a high bar — only promote principles repeated across sessions.

## Insights
This is a research project. Capture experimental findings even if tentative.
```

This file is optional. Distill reads it (if present) and applies overrides to default criteria.

## Quality Bar

Every addition costs context space in every future session. Distill applies strict criteria:

- **Future Value Test** — Will this help Claude in future sessions?
- **Conceptual Test** — Would this matter if we changed the tech stack?
- **Uniqueness Test** — Is this already captured or general knowledge?
- **Conciseness** — One sentence for principles, anti-patterns, insights
