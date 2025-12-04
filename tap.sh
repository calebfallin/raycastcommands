#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Tap
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧹
# @raycast.packageName Productivity

# Documentation:
# @raycast.description Closes ALL open applications and returns to clean desktop
# @raycast.author Caleb Fallin

# Get list of all running applications (excluding system processes)
# and quit them using AppleScript
osascript <<EOF
tell application "System Events"
    set appList to name of every application process where background only is false
end tell

repeat with appName in appList
    -- Skip Finder and System Settings to avoid disrupting the system
    if appName is not in {"Finder", "System Settings", "System Preferences", "Raycast"} then
        try
            tell application appName to quit
        end try
    end if
end repeat
EOF

# Give apps a moment to close gracefully
sleep 1

# Force quit any stubborn apps that didn't close (excluding essential system apps)
osascript <<EOF
tell application "System Events"
    set remainingApps to name of every application process where background only is false
end tell

repeat with appName in remainingApps
    if appName is not in {"Finder", "System Settings", "System Preferences", "Raycast"} then
        try
            do shell script "killall " & quoted form of appName
        end try
    end if
end repeat
EOF

# Empty the trash
osascript -e 'tell application "Finder" to empty trash'

echo "All applications closed and trash emptied"

