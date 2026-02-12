# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a collection of Raycast Script Commands for macOS automation. These are shell scripts that integrate with Raycast to provide quick productivity shortcuts. All scripts are standalone and use Raycast's metadata format (`@raycast.*` comments) to define their behavior in the Raycast UI.

## Architecture

**Script Structure:**
- Each script is a standalone `.sh` file with Raycast metadata in comments at the top
- Scripts use `@raycast.mode silent` for background operations or `@raycast.mode fullOutput` for showing results
- Scripts that need user input use `@raycast.argument1` (see braindump.sh)
- All scripts handle dependency checking and provide clear error messages

**Raycast Metadata Format:**
```bash
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title <Display Name>
# @raycast.mode <silent|fullOutput>

# Optional parameters:
# @raycast.icon <emoji>
# @raycast.packageName <Category>
# @raycast.argument1 { "type": "text", "placeholder": "..." }

# Documentation:
# @raycast.description <What the script does>
# @raycast.author <Author Name>
```

## Script Categories

**Audio/Hardware:**
- `connect-airpods.sh` - Bluetooth connection and audio switching using blueutil and SwitchAudioSource

**Productivity:**
- `braindump.sh` - Quick note-taking that prepends to Obsidian file
- `tap.sh` - Closes all apps and empties trash (cleanup routine)

**Browser/Work:**
- `start-work.sh` - Opens work environment (Todoist, Slack, Chrome with work profile)
- `personal.sh` - Opens Chrome with personal profile

## Dependencies

Scripts use Homebrew packages:
- `blueutil` - Bluetooth device management (connect-airpods.sh)
- `switchaudio-osx` - Audio device switching (connect-airpods.sh)

Install dependencies:
```bash
brew install blueutil switchaudio-osx
```

## Development

**Making scripts executable:**
```bash
chmod +x *.sh
```

**Testing a script directly:**
```bash
./script-name.sh [arguments]
```

**Adding to Raycast:**
1. Open Raycast Preferences → Extensions → Script Commands
2. Add this directory
3. Scripts appear in Raycast based on their `@raycast.title`

## Configuration

**User-specific values to update when modifying:**
- AirPods MAC address and name in `connect-airpods.sh`
- Chrome profile numbers in `start-work.sh` and `personal.sh`
- Obsidian note path in `braindump.sh`
- URLs and apps in work/personal startup scripts

**Finding Chrome profile directory:**
```bash
ls ~/Library/Application\ Support/Google/Chrome/ | grep Profile
```

## Script Patterns

**AppleScript integration:**
Scripts like `tap.sh` use `osascript` with heredocs for complex macOS automation:
```bash
osascript <<EOF
tell application "System Events"
    -- AppleScript commands here
end tell
EOF
```

**Silent mode best practices:**
- Redirect tool output to `/dev/null 2>&1` or `&> /dev/null`
- Always `echo` a final status message for Raycast HUD
- Exit with proper codes (0 for success, 1 for error)
