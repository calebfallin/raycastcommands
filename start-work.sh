#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Work
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💼
# @raycast.packageName Work Setup

# Documentation:
# @raycast.description Opens Todoist, Slack, Spark Mail, Chrome, and Claude in sequence
# @raycast.author Caleb Fallin

# Open Todoist
open -a "Todoist"
sleep 2

# Open Slack to Tyfone workspace
open "slack://open?team=T02SGKB4P"
sleep 2

# Open Spark Desktop
open -a "Spark Desktop"
sleep 6

# Launch Chrome with Tyfone profile and open Retool workspace and Salesforce
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --profile-directory="Profile 7" \
  "https://calebfallin.retool.com/apps/465eb220-0469-11f1-b9a6-638c09f8a567/Workspace/Home" \
  "https://redshoecrewtyfone.lightning.force.com/lightning/page/home" \
  > /dev/null 2>&1 &
sleep 3

# Open Claude
open -a "Claude"

echo "✅ Started work environment: Todoist, Slack, Spark Mail, Chrome, and Claude"

