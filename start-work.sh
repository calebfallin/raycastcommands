#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Work
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💼
# @raycast.packageName Work Setup

# Documentation:
# @raycast.description Opens Todoist, Slack, and Chrome with work profile (Gmail, Calendar, Drive)
# @raycast.author Caleb Fallin

# Open Todoist
open -a "Todoist"

# Open Slack
open -a "Slack"

# Launch Chrome with Profile 7 (Work) and open work tabs
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --profile-directory="Profile 7" \
  "https://mail.google.com" \
  "https://calendar.google.com/calendar/u/0/r/week" \
  "https://drive.google.com/drive/u/0/my-drive" \
  > /dev/null 2>&1 &

echo "✅ Started work environment: Todoist, Slack, and Chrome with work profile"

