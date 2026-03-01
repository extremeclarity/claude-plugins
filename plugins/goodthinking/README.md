# Good Thinking

Thinking skills that improve conversation quality before execution begins. Conversations go wrong in predictable ways — unclear goals, untested assumptions, narrow solution exploration, rigged option sets. Good Thinking catches these upstream.

## Installation

1. Open the plugin manager in Claude Code
   ```
   /plugin
   ```

2. Add the Extreme Clarity marketplace
   ```
   extremeclarity/claude-plugins
   ```

3. Install the Good Thinking plugin from the marketplace

## Skills

### Understanding

| Skill | What it achieves |
|-------|------------------|
| xc-clarify-framing | Sharpens problem and goal statements to be more precise, unambiguous, complete, and well-scoped |
| xc-breakdown-problem | Breaks complex problems and goals into independent parts that can be tackled separately |
| xc-test-thesis | Tests whether a thesis or hypothesis holds up under adversarial scrutiny |

### Decision Making

| Skill | What it achieves |
|-------|------------------|
| xc-stress-test-decision | Stress-tests a decision or position by surfacing concerns the user may not have considered |
| xc-audit-options | Checks whether a set of options is well-constructed before the user evaluates |

### Ideation

| Skill | What it achieves |
|-------|------------------|
| xc-brainstorm | Generates diverse solution ideas using parallel agents with different perspectives |
| xc-group-ideas | Consolidates raw ideas into strategic themes by deduplicating and grouping |

## How It Works

Skills are loaded eagerly — Claude notices when a skill might apply and suggests it conversationally. Each skill has an evaluation step that determines relevance before running a full workflow.

Skills use multi-agent patterns where beneficial. For example, `xc-test-thesis` spawns parallel Analyst and Skeptic agents that build opposing cases, exchange findings, and refine — then Claude synthesises the results into a defensibility spectrum. `xc-brainstorm` spawns parallel agents with different diversity primes to avoid converging on variations of one idea.

Context-blind agents (no access to conversation history or files) are used deliberately to prevent backward rationalisation and ensure genuine reasoning diversity.

## Commands

```
/goodthinking:list-skills    # List available skills with descriptions
```
