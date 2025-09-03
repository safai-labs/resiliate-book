#!/bin/bash

# Script to check status of mdBook server running in tmux

SESSION_NAME="mdbook"

# Check if session exists
if ! tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "mdBook server is NOT running"
    echo "To start it: ./mdbook-start.sh [port]"
    exit 1
fi

# Get server IP and port
SERVER_IP=$(hostname -I | awk '{print $1}')
SERVER_NAME=$(hostname -f)
PORT=$(tmux capture-pane -pt $SESSION_NAME | grep -o "listening on http://0.0.0.0:[0-9]*" | grep -o "[0-9]*$" || echo "3000")

echo "mdBook server IS running in tmux session '$SESSION_NAME'"
echo "Access your book at:"
echo "  http://$SERVER_IP:$PORT"
echo "  http://$SERVER_NAME:$PORT (if DNS is configured)"
echo ""
echo "To view the server output: tmux attach -t $SESSION_NAME"
echo "To detach from tmux (keep server running): Press Ctrl+B then D"
echo "To stop the server: ./mdbook-stop.sh"
