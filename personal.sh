#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Personal
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👤
# @raycast.packageName Browser

# Documentation:
# @raycast.description Opens a new Chrome tab using Profile 5
# @raycast.author Caleb Fallin

# Chrome Profile 5 path
PROFILE_DIR="Profile 5"

# Open Chrome with Profile 5 and create a new tab
open -na "Google Chrome" --args --profile-directory="$PROFILE_DIR" --new-window

echo "Opened Chrome with Profile 5"

