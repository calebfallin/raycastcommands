#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title AirPods
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🎧
# @raycast.packageName Audio

# Documentation:
# @raycast.description Connects to AirPods and switches all audio input/output
# @raycast.author Caleb Fallin

# AirPods configuration
AIRPODS_NAME="Caleb's AirPods Pro"
AIRPODS_MAC="98-a5-f9-3b-d4-39"

# Check if blueutil is installed
if ! command -v blueutil &> /dev/null; then
    echo "Error: blueutil is not installed. Install with: brew install blueutil"
    exit 1
fi

# Check if SwitchAudioSource is installed
if ! command -v SwitchAudioSource &> /dev/null; then
    echo "Error: SwitchAudioSource is not installed. Install with: brew install switchaudio-osx"
    exit 1
fi

# Check if AirPods are already connected
if blueutil --is-connected "$AIRPODS_MAC" 2>/dev/null | grep -q "1"; then
    # Already connected, just ensure they're the active audio device
    SwitchAudioSource -s "$AIRPODS_NAME" -t output &> /dev/null
    SwitchAudioSource -s "$AIRPODS_NAME" -t input &> /dev/null
    echo "AirPods already connected"
    exit 0
fi

# Connect to AirPods
blueutil --connect "$AIRPODS_MAC" &> /dev/null

# Wait briefly for connection to establish (max 3 seconds)
for i in {1..6}; do
    if blueutil --is-connected "$AIRPODS_MAC" 2>/dev/null | grep -q "1"; then
        break
    fi
    sleep 0.5
done

# Switch audio output and input to AirPods
SwitchAudioSource -s "$AIRPODS_NAME" -t output &> /dev/null
SwitchAudioSource -s "$AIRPODS_NAME" -t input &> /dev/null

echo "Connected to AirPods"

