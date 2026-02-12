#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Work
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💼
# @raycast.packageName Work Setup

# Documentation:
# @raycast.description Opens Todoist, Claude, Spark Mail, and Chrome with Tyfone profile (Retool workspace)
# @raycast.author Caleb Fallin

# Open Todoist
open -a "Todoist"

# Open Claude
open -a "Claude"

# Open Spark
open -a "Spark"

# Launch Chrome with Tyfone profile and open Retool workspace
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --profile-directory="Profile 7" \
  "https://calebfallin.retool.com/apps/465eb220-0469-11f1-b9a6-638c09f8a567/Workspace/Home" \
  > /dev/null 2>&1 &

echo "✅ Started work environment: Todoist, Claude, Spark, and Chrome with Tyfone profile"

