#!/bin/bash

# Default directory for images
IMAGE_DIR="."
DISPLAY_TIME=10  # Time in seconds to display each image
DELAY=0  # Delay in seconds before starting the slideshow

# Get the first image in the directory
find "$IMAGE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r image; do
    echo "Showing: $image"

    sleep "$DELAY"
    
    # Use ffmpeg to display the image in a window
    ffplay -vf scale=1920:-1 -fs -an -loglevel error "$image" > /dev/null 2>&1 &

    # Capture the ffplay process ID
    FFPLAY_PID=$!
    
    # Sleep for the desired display time
    sleep "$DISPLAY_TIME"

    # Kill the ffplay process after the display time
    kill "$FFPLAY_PID" 2>/dev/null
done

