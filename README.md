# Raycast Scripts

Custom scripts for Raycast automation.

## Scripts

### Connect AirPods (`connect-airpods.sh`)

Connects to your AirPods and automatically switches all audio input/output to them.

**Features:**
- Fast execution - checks connection status first
- Only connects if not already connected
- Never disconnects from AirPods
- Automatically switches both input and output audio
- Works in silent mode for seamless integration

**Dependencies:**
```bash
brew install blueutil
brew install switchaudio-osx
```

**Usage:**
1. Add this script directory to Raycast (Preferences → Extensions → Script Commands → Add Directory)
2. Invoke with Command+Space, type "Connect AirPods"
3. The script will connect and switch audio automatically

## Setup

1. Install dependencies:
```bash
brew install blueutil switchaudio-osx
```

2. Make scripts executable:
```bash
chmod +x *.sh
```

3. Add this directory to Raycast:
   - Open Raycast Preferences
   - Go to Extensions → Script Commands
   - Click the + button and add this directory

