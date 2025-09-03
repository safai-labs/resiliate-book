#!/bin/bash

# Script to stop mdBook server running in tmux

SESSION_NAME="mdbook"

# Check if session exists
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "No mdBook server running in tmux session '$SESSION_NAME'"
    exit 0
fi

# Kill the tmux session
echo "Stopping mdBook server..."
tmux kill-session -t $SESSION_NAME
echo "mdBook server stopped successfully!"
