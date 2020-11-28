# Check for env var
TARGET_DIR=~/notes
if [ -n "$NOTES_DIR" ]; then
  TARGET_DIR=$NOTES_DIR
fi

# Generate the filename
DATE=`date +%Y-%m-%d`
FILENAME=$TARGET_DIR/$DATE.txt

# Check if tmux session exists
tmux has-session -t notes 2>/dev/null

# If session exists, open the file there
if [ $? == 0 ]; then
	# Open new page and move to first tab
	tmux send-keys -t notes:0.2 Escape ":tabe $DATE.txt" Enter
	tmux send-keys -t notes:0.2 ":tabm 0" Enter
	tmux select-pane -t notes:0.2
# If it doesn't exist, open the file in vim
else
	vim $FILENAME
fi
