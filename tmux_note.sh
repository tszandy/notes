tmux Command

ctrl+B then % # Split windows left right.
tmux split-window -h

ctrl+B then “ # Split windows top down.
tmux split-window -v

ctrl+B then Left-Arrow # move to left window
ctrl+B then Right-Arrow # move to right window
ctrl+B then Up-Arrow # move to up window
ctrl+B then Down-Arrow # move to down window

tmux # Start Session
tmux new -s ${session_name}
tmux new-session -s ${session_name} 

tmux select-window -t 0 # tmux select window 0

tmux select-pane -t 0 # tmux select pane 0

tmux send-keys '${command}' # tmux type ${command}

tmux send-keys '${command}' C-m # tmux type ${command} and run by send key control + m

ctrl+B then C # add new window.
tmux new-window
tmux new-window -n ${windows-name} ${shell-command} # create new window run ${shell-command} with name ${windows-name}
tmux new-window -n ${windows-name} -d ${shell-command} # create new window run ${shell-command} with name ${windows-name} new window is not current window

ctrl+B then & # kill window
tmux kill-window -t ${name} # kill window ${name}

ctrl+B then , # rename current window.
tmux rename-window ${name}


ctrl+B then ${number} # go to ${number} window.
ctrl+B then X # kill panel.

ctrl+B then D # detached session.
tmux detach # detached session.

tmux kill-session -t ${session_name} # kill session ${session_name}

tmux ls # list of all running sessions
tmux attach -t ${name} # attach to session ${name}

tmux new -s ${name} # create a new session with the name “name”.
tmux rename-session -t ${name1} ${name2} # rename session ${name1} to ${name2}

#create new window of four pane 
tmux new-window -n ${new_window_name}
tmux split-window -v 
tmux select-pane -t 0
tmux split-window -h 
tmux select-pane -t 2
tmux split-window -h 

tmux attach-session -t ${session_name} # tmux attach to session ${session_name}

tmux setenv ${VARIABLE_NAME} ${variable_value}


# kill all tmux session
pkill -f tmux




# tmux file example
""" 
#!/bin/bash
tmux kill-session -t ${new_session_name}

tmux new-session -d -s ${new_session_name}

tmux split-window -v 
tmux select-pane -t 0
tmux split-window -h 
tmux select-pane -t 2
tmux split-window -h 

tmux select-window -t 0
tmux select-pane -t 0
tmux send-keys '${command}' C-m

tmux select-window -t 0
tmux select-pane -t 1
tmux send-keys '${command}' C-m

tmux select-window -t 0
tmux select-pane -t 2
tmux send-keys '${command}' C-m

tmux select-window -t 0
tmux select-pane -t 3
tmux send-keys '${command}' C-m

tmux attach -t ${new_session_name}
"""

tmux new-window -n ${new_window_name}
tmux split-window -v 
tmux select-pane -t 0
tmux split-window -h 
tmux select-pane -t 2
tmux split-window -h 

tmux select-window -t 0
tmux select-pane -t 0
tmux send-keys '${command}' C-m

tmux select-window -t 0
tmux select-pane -t 1
tmux send-keys '${command}' C-m

tmux select-window -t 0
tmux select-pane -t 2
tmux send-keys '${command}' C-m

tmux select-window -t 0
tmux select-pane -t 3
tmux send-keys '${command}' C-m
