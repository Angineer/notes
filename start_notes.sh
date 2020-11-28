# Start up new session with 3 panes
tmux new -d -s notes
tmux split-window -t notes
tmux split-window -h -t notes:0.0

# Open todo list on top left
tmux respawn-pane -t notes:0.0 -k "vim ~/notes/todo.txt"

# Find most recent notes file in folder
RECENT="$(find ~/notes -name '2*.txt' -print0 | sort -r -z | tr '\0' '\n' | head -n 5 | tr '\n' ' ')"
#echo $RECENT > test.txt

# Open tabbed notes in bottom
tmux respawn-pane -t notes:0.2 -k "cd ~/notes && vim -p $RECENT"

# Attach to session
tmux select-pane notes:0.1
tmux attach-session -t notes
