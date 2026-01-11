#!/bin/bash
# Initialize worldview context directories from schema
# Outputs: STATUS:CREATED, STATUS:EXISTS, or STATUS:FAILURE

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCHEMA_FILE="$SCRIPT_DIR/context-schema.json"

# Context lives in PROJECT directory, not plugin directory
TARGET_DIR="${PROJECT_DIR:-${CLAUDE_PROJECT_DIR:-$(pwd)}}"
WORLDVIEW_DIR="$TARGET_DIR/.worldview"

# Check if worldview already exists
if [ -d "$WORLDVIEW_DIR" ]; then
    echo "STATUS:EXISTS"
    echo "Worldview already initialized at $WORLDVIEW_DIR"
    exit 0
fi

# Validate schema file exists
if [ ! -f "$SCHEMA_FILE" ]; then
    echo "STATUS:FAILURE"
    echo "Schema file not found: $SCHEMA_FILE"
    exit 1
fi

# Extract all location paths from schema
if command -v jq &> /dev/null; then
    locations=$(jq -r '.components[].location, .components[].indexFile.location // empty' "$SCHEMA_FILE" 2>/dev/null)
else
    locations=$(grep -o '"location": "[^"]*"' "$SCHEMA_FILE" | cut -d'"' -f4)
fi

if [ -z "$locations" ]; then
    echo "STATUS:FAILURE"
    echo "No locations found in schema"
    exit 1
fi

# Create directories and files
created_count=0
for loc in $locations; do
    full_path="$TARGET_DIR/$loc"

    if [[ "$loc" == */ ]]; then
        mkdir -p "$full_path" && ((created_count++))
    else
        mkdir -p "$(dirname "$full_path")"
        touch "$full_path" && ((created_count++))
    fi
done

if [ $created_count -gt 0 ]; then
    echo "STATUS:CREATED"
    echo "Initialized worldview at $WORLDVIEW_DIR"
    echo "Created $created_count paths"
else
    echo "STATUS:FAILURE"
    echo "No paths were created"
    exit 1
fi
