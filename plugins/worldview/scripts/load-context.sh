#!/bin/bash
# Load context for SessionStart hook
# Only loads if worldview exists - does NOT auto-create

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
SCHEMA_FILE="$SCRIPT_DIR/context-schema.json"

# Context lives in PROJECT directory, not plugin directory
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
WORLDVIEW_DIR="$PROJECT_DIR/.worldview"

# Exit early if no worldview in this project
if [ ! -d "$WORLDVIEW_DIR" ]; then
    exit 0
fi

# Build context output
build_context() {
    local context=""

    # Start with inject-context.md (what worldview is, commands)
    local inject="$PLUGIN_ROOT/injections/inject-context.md"
    if [ -f "$inject" ]; then
        context+="$(cat "$inject")"$'\n\n'
    fi

    if [ ! -f "$SCHEMA_FILE" ]; then
        echo "Schema file not found: $SCHEMA_FILE" >&2
        return 1
    fi

    # Load each component with its usage instruction
    if command -v jq &> /dev/null; then
        # Get file components
        local components=$(jq -c '.components[] | select(.type == "file" and .loaded == "SessionStart")' "$SCHEMA_FILE" 2>/dev/null)

        while IFS= read -r comp; do
            local name=$(echo "$comp" | jq -r '.name')
            local location=$(echo "$comp" | jq -r '.location')
            local usage=$(echo "$comp" | jq -r '.usage')
            local filepath="$PROJECT_DIR/$location"

            if [ -f "$filepath" ] && [ -s "$filepath" ]; then
                context+="## $name"$'\n'
                context+="*$usage*"$'\n\n'
                context+="$(cat "$filepath")"$'\n\n'
            fi
        done <<< "$components"

        # Get directory components (frameworks)
        local dir_components=$(jq -c '.components[] | select(.type == "directory")' "$SCHEMA_FILE" 2>/dev/null)

        while IFS= read -r comp; do
            local name=$(echo "$comp" | jq -r '.name')
            local index_location=$(echo "$comp" | jq -r '.indexFile.location')
            local usage=$(echo "$comp" | jq -r '.usage')
            local filepath="$PROJECT_DIR/$index_location"

            if [ -f "$filepath" ] && [ -s "$filepath" ]; then
                context+="## $name"$'\n'
                context+="*$usage*"$'\n\n'
                context+="$(cat "$filepath")"$'\n\n'
            fi
        done <<< "$dir_components"
    else
        # Fallback without jq - hardcoded usage
        context+="## Terminology"$'\n'
        context+="*Use this terminology to ensure interpretive alignment with the user.*"$'\n\n'
        local f="$PROJECT_DIR/.worldview/terminology.txt"
        [ -f "$f" ] && [ -s "$f" ] && context+="$(cat "$f")"$'\n\n'

        context+="## Principles"$'\n'
        context+="*Use these to guide reasoning and apply when making recommendations or tradeoffs.*"$'\n\n'
        f="$PROJECT_DIR/.worldview/principles.txt"
        [ -f "$f" ] && [ -s "$f" ] && context+="$(cat "$f")"$'\n\n'

        context+="## Anti-patterns"$'\n'
        context+="*Check against these before proposing solutions.*"$'\n\n'
        f="$PROJECT_DIR/.worldview/anti-patterns.txt"
        [ -f "$f" ] && [ -s "$f" ] && context+="$(cat "$f")"$'\n\n'

        context+="## Insights"$'\n'
        context+="*Treat these as established facts when reasoning about the project.*"$'\n\n'
        f="$PROJECT_DIR/.worldview/insights.txt"
        [ -f "$f" ] && [ -s "$f" ] && context+="$(cat "$f")"$'\n\n'

        context+="## Frameworks"$'\n'
        context+="*Read the full framework file when tackling a relevant problem type.*"$'\n\n'
        f="$PROJECT_DIR/.worldview/frameworks/index.txt"
        [ -f "$f" ] && [ -s "$f" ] && context+="$(cat "$f")"$'\n\n'
    fi

    echo "$context"
}

# Output context
build_context
