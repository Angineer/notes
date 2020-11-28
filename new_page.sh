# Create new page with today's date
DATE=`date +%Y-%m-%d`

# Send to background to allow to complete
#tmux send-keys -t notes:0.2 C-z

# Open new page and move to first tab
tmux send-keys -t notes:0.2 Escape ":tabe $DATE.txt" Enter
tmux send-keys -t notes:0.2 ":tabm 0" Enter
tmux select-pane -t notes:0.2
