#!/bin/bash

# Default directory for images
IMAGE_DIR="/Users/alvinkwabena/Documents/Developer/art754/shell-scripting/choreographing-computers/"
DELAY= 10

# Get the first image in the directory
image=$(find "$IMAGE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | head -n 1)

if [[ -n "$image" ]]; then
    echo "Showing: $image"
    # Delay opening the image to allow for any necessary setup
    sleep $DELAY
    open -a Preview "$image"
    osascript -e 'tell application "Preview"
        activate
        tell application "System Events"
            keystroke "f" using {command down, control down}
        end tell
    end tell'
    sleep 10  # Wait to allow the image to display
    osascript -e 'tell application "Preview" to quit'
else
    echo "No images found in $IMAGE_DIR."
fi