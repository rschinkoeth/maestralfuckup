#!/bin/bash

while true; do
  mstat="imdead"
  mstat=$(timeout 5 maestral status | grep 'Syncing\|unexpected\|not running\|Paused')
#  echo $mstat

  if [[ $mstat == "imdead" ]]; then
#    echo $mstat "first"
    sudo pkill -9 python
    maestral start
    mstat=$(maestral status | grep 'unexpected\|not running\|Paused')
#    maestral status
  else
#    echo $mstat
    if [[ $mstat == *"not running"* ]]; then
      tmux send-keys -t mfuck:0.1 'maestral log show | tail -10' Enter
      tmux send-keys '/bin/zsh bottomleft.sh' Enter
      sudo pkill -9 python
      maestral start
    elif [[ $mstat == *"Paused"* ]]; then
      tmux send-keys -t mfuck:0.1 'maestral log show | tail -10' Enter
      tmux send-keys '/bin/zsh bottomleft.sh' Enter
      sudo pkill -9 python
      maestral start
    elif [[ $mstat == *"unexpected"* ]]; then
      tmux send-keys -t mfuck:0.1 'maestral log show | tail -10' Enter
      tmux send-keys '/bin/zsh bottomleft.sh' Enter
      sudo pkill -9 python
      maestral start
    else
      clear
      size=$(timeout 60 du -sh /mnt/dropbox | awk '{print $1}')
      echo $size
      maestral status
    fi
  fi
  sleep 5
done