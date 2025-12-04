#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Braindump
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧠
# @raycast.packageName Productivity
# @raycast.argument1 { "type": "text", "placeholder": "What's on your mind?" }

# Documentation:
# @raycast.description Prepends a timestamped entry to your braindump Obsidian note
# @raycast.author Caleb Fallin

set -euo pipefail

# File to write to
NOTE_PATH="/Users/calebfallin/Desktop/Obsidian/writing/braindump.md"

# Argument passed from Raycast
ENTRY="$1"

# Timestamp mm/dd/yy HH:MM (24h)
TIMESTAMP="$(date +"%m/%d/%y %H:%M")"

# Ensure folder & file exist
mkdir -p "$(dirname "$NOTE_PATH")"
touch "$NOTE_PATH"

# Create the new entry with a blank line after it
NEW_ENTRY="${TIMESTAMP}: ${ENTRY}\n"

# Prepend the new entry to the file
TMP_FILE=$(mktemp)
{
  echo "$NEW_ENTRY"
  cat "$NOTE_PATH"
} > "$TMP_FILE"

mv "$TMP_FILE" "$NOTE_PATH"

echo "✅ Braindump saved: ${ENTRY}"

