#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Freelance
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚀
# @raycast.packageName Work Setup

# Documentation:
# @raycast.description Opens Todoist, Slack, Spark Mail, Chrome, and Claude for freelance work
# @raycast.author Caleb Fallin

# Open Todoist
open -a "Todoist"
sleep 2

# Open Slack to personal workspace
open "slack://open?team=T08P4EM69D3"
sleep 2

# Open Spark Desktop
open -a "Spark Desktop"
sleep 6

# Launch Chrome with freelance profile and open Retool workspace
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --profile-directory="Profile 11" \
  "https://calebfallin.retool.com/apps/465eb220-0469-11f1-b9a6-638c09f8a567/Workspace/Home" \
  > /dev/null 2>&1 &
sleep 3

# Open Claude
open -a "Claude"

echo "✅ Started freelance environment: Todoist, Slack, Spark Mail, Chrome, and Claude"

