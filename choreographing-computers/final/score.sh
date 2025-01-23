#!/bin/bash

# Default directory for images
IMAGE_DIR="./images"
IMAGE_NAME="AOB_0.png"
DISPLAY_TIME=10  # Time in seconds to display each image
DELAY=0  # Delay in seconds before starting the slideshow
IMAGE="$IMAGE_DIR/$IMAGE_NAME"

# If I want to randomly select an image from the directory, uncomment the following lines:
# IMAGE=$(find "$IMAGE_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n 1)


echo "Showing: $IMAGE"

sleep "$DELAY"

# Use ffmpeg to display the image in a window
ffplay -vf scale=1920:-1 -fs -an -loglevel error "$IMAGE" > /dev/null 2>&1 &

# Capture the ffplay process ID
FFPLAY_PID=$!

# Sleep for the desired display time
sleep "$DISPLAY_TIME"

# Kill the ffplay process after the display time
kill "$FFPLAY_PID" 2>/dev/null

