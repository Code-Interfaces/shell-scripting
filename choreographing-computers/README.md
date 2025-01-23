# Choreographing Computers

In this brief introduction to Shell scripting we would be building a simple script to display an image using ffmpeg.

---

## What Does This Script Do?

1. Takes an image from a directory.
2. Displays the image in a full-screen window using `ffplay` (a part of `ffmpeg`).
3. Automatically closes the display window after a set time.
4. Introduces you to working with process IDs (PIDs) and managing processes in a script.

---

## 🛠️ Getting Started

### Prerequisites

- A terminal (Linux, macOS, or WSL on Windows).
- `bash` installed (most systems have it by default).
- `ffmpeg` installed ([Download here](https://ffmpeg.org/download.html)) or use Homebrew:

  ```bash
  brew install ffmpeg
  ```
  
for WSL users:

```bash
sudo apt update
sudo apt install ffmpeg
```

## Step-by-Step Guide

Follow these steps to write your script from scratch:

### Step 1: Open a New File

Open your terminal and create a new bash file:

```bash
touch score.sh
chmod +x score.sh
```

### Step 2: Start the Script

Edit the file with your favorite text editor (e.g., sublime text, cursor, or VS Code) and add the shebang line:

```bash
#!/bin/bash
```

The shebang ensures the script runs with the correct interpreter.

### Step 3: Define Variables

Add variables to customize the script:

```bash
# Default directory for images
IMAGE_DIR="./images"
IMAGE_NAME="AOB_0.png" 
DISPLAY_TIME=10  # Time in seconds to display each image
DELAY=0  # Delay in seconds before starting the slideshow
IMAGE="$IMAGE_DIR/$IMAGE_NAME"
```

### Step 4: Add Echo Statements

Provide feedback to the user:

```bash
echo "Showing: $IMAGE"
sleep "$DELAY"
```

### Step 5: Display the Image

Use `ffplay` to display the image in a full-screen window:

```bash
# Use ffmpeg to display the image in a window
ffplay -vf scale=1920:-1 -fs -an -loglevel error "$IMAGE" > /dev/null 2>&1 &

# Capture the ffplay process ID
FFPLAY_PID=$!
```

### Step 6: Wait and Terminate

Add a delay to display the image and clean up:

```bash
# Sleep for the desired display time
sleep "$DISPLAY_TIME"

# Kill the ffplay process after the display time
kill "$FFPLAY_PID" 2>/dev/null
```

### Step 7: Save and Run

Save the file and execute your script:

```bash
./score.sh
```

---

## In-Class Exercise

Want to take this further? Try these:

1. Modify the script to display a slideshow of multiple images.
2. Add a feature to randomize the order of images.

---
