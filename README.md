# Extreme Clarity

Thinking skills that improve conversation quality before execution begins. Conversations go wrong in predictable ways. Goals are unclear. Assumptions go untested. Solution exploration stays narrow. Option sets arrive rigged. Extreme Clarity catches these upstream.

## Installation

1. Open the plugin manager in Claude Code
   ```
   /plugin
   ```

2. Add the Extreme Clarity marketplace
   ```
   extremeclarity/claude-plugins
   ```

3. Install the Extreme Clarity plugin from the marketplace

## Skills

### Understanding

| Skill | What it achieves |
|-------|------------------|
| clarify-framing | Sharpens problem and goal statements to be more precise, unambiguous, complete, and well-scoped |
| breakdown-problem | Breaks complex problems and goals into independent parts that can be tackled separately |
| test-thesis | Tests whether a thesis or hypothesis holds up under adversarial scrutiny |

### Decision Making

| Skill | What it achieves |
|-------|------------------|
| stress-test-decision | Stress-tests a decision or position by surfacing concerns the user may not have considered |
| audit-options | Checks whether a set of options is well-constructed before the user evaluates |

### Ideation

| Skill | What it achieves |
|-------|------------------|
| brainstorm | Generates diverse solution ideas using parallel agents with different perspectives |
| group-ideas | Consolidates raw ideas into strategic themes by deduplicating and grouping |

## How It Works

Skills are loaded eagerly. Claude notices when a skill might apply and suggests it conversationally. Each skill has an evaluation step that determines relevance before running a full workflow.

Skills use multi-agent patterns where beneficial. `test-thesis` spawns parallel Analyst and Skeptic agents that build opposing cases, exchange findings, and refine. Claude then synthesises the results into a defensibility spectrum. `brainstorm` spawns parallel agents with different diversity primes so they avoid converging on variations of one idea.

Context-blind agents have no access to conversation history or files. They are used deliberately to prevent backward rationalisation and ensure genuine reasoning diversity.

## Commands

```
/extremeclarity:list-skills    # List available skills with descriptions
```

## Repository Layout

```
.claude-plugin/
  plugin.json          Plugin manifest
  marketplace.json     Marketplace manifest
skills/                One directory per skill, each holding a SKILL.md
commands/              Slash commands
```
