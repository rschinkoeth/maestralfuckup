#!/bin/bash
# kill sess
tmux kill-session -t mfuck

# make sess
tmux new-session -d -s mfuck

#make layout
tmux split-window -h -t mfuck
tmux select-pane -t 0.0
tmux split-window -v -t mfuck
tmux select-pane -t 0.2
tmux split-window -v -t mfuck

# select top left
tmux select-pane -t 0.0
tmux send-keys "nload -u M devices ens18" Enter

#select bottom left
tmux select-pane -t 0.1
tmux send-keys "echo no log yet" Enter

#select top right
tmux select-pane -t 0.2 #top right
tmux send-keys '/bin/bash topright.sh' Enter

#select bottom right
tmux select-pane -t 0.3
tmux send-keys '/bin/bash $bottomright.sh' Enter



tmux attach-session -t mfuck

