#!/bin/bash
set -e

# Start Xvfb
Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &
export DISPLAY=:99
sleep 2

# Start VNC server
x11vnc -display :99 -forever -shared -rfbport 5900 -nopw -quiet &

# Start the game
python main.py