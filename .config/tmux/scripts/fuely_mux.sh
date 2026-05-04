#!/bin/bash

session="Fuely"

tmux new-session -d -s $session -n "Serve"
tmux send-keys -t "$session:Serve" "cd ~/Documents/source/fuely/fuely_cast/" C-m
tmux send-keys -t "$session:Serve" "nvim" C-m

tmux new-window -t $session -n "Cast"
tmux send-keys -t "$session:Cast" "cd ~/Documents/source/fuely/fuely_cast/" C-m
tmux send-keys -t "$session:Cast" "nvim" C-m

tmux new-window -t $session -n "Dev"
tmux send-keys -t "$session:Dev" "cd ~/Documents/source/fuely/" C-m

tmux attach-session -t $session
