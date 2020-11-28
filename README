This is a simple set of scripts for automating notetaking in text files. The scripts make a couple of assumptions:
- There is a single directory on the computer where the notes will be kept. By default, this is ~/notes. You can set the NOTES_DIR environment variable to use a different directory.
- The filenames use the format YYYY-MM-DD.txt and there is a single file for each day

Each script behaves as follows:
- `start_notes.sh`: Starts a new tmux session for notetaking. The session includes a todo list, a regular shell, and the most recent notes pages open in vim.
- `new_page.sh`: Creates a new note for the current date if one doesn't exist already. If the notes session is active, the note is opened in the bottom panel. If the notes session is not active, it is opened in a standalone vim session.
- `exit_notes.sh`: Cleans up temp files and closes the notes session.
