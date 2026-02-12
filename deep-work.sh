#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Deep Work
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🎯
# @raycast.packageName Shortcuts

# Documentation:
# @raycast.description Runs the Deep Work shortcut
# @raycast.author Caleb Fallin

# Check if shortcuts command is available
if ! command -v shortcuts &> /dev/null; then
    echo "Error: shortcuts command not found"
    exit 1
fi

# Run the Deep Work shortcut
if shortcuts run "Deep Work" &> /dev/null; then
    echo "Deep Work shortcut launched"
else
    echo "Error: Failed to run Deep Work shortcut"
    exit 1
fi
