# Check for env var
TARGET_DIR=~/notes
if [ -n "$NOTES_DIR" ]; then
  TARGET_DIR=$NOTES_DIR
fi

#!/bin/sh
rm $TARGET_DIR/.*.txt.swp
tmux kill-session -t notes
