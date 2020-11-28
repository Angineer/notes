# Check for existing session; set it up if not already running
tmux has-session -t notes 2>/dev/null

if [ $? != 0 ]; then
	# Check for env var
	TARGET_DIR=~/notes
	if [ -n "$NOTES_DIR" ]; then
	  TARGET_DIR=$NOTES_DIR
	fi

	# Start up new session with 3 panes
	tmux new -d -s notes
	tmux split-window -t notes
	tmux split-window -h -t notes:0.0

	# Open todo list on top left
	tmux respawn-pane -t notes:0.0 -k "vim $TARGET_DIR/todo.txt"

	# Find most recent notes file in folder
	RECENT="$(find $TARGET_DIR -name '2*.txt' -print0 | sort -r -z | tr '\0' '\n' | head -n 5 | tr '\n' ' ')"
	#echo $RECENT > test.txt

	# Open tabbed notes in bottom
	tmux respawn-pane -t notes:0.2 -k "cd $TARGET_DIR && vim -p $RECENT"
fi

# Attach to session
tmux attach-session -t notes
