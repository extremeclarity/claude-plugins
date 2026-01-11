# ExtremeClarity Plugins

Claude Code plugins for high-leverage AI collaboration.

## Installation

1. Add the marketplace:
   ```
   /plugin marketplace add extremeclarity/claude-plugins
   ```

2. Install plugins from the marketplace (see below)

## Available Plugins

### Worldview

Context persistence system. Captures durable knowledge that survives across sessions.

```
/plugin install worldview@extremeclarity
```

Then initialize in your project:
```
/worldview:setup
```

See [plugins/worldview/README.md](plugins/worldview/README.md) for details.
