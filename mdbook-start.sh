#!/bin/bash

# Script to start mdBook server in a tmux session
# This allows the server to continue running after SSH session ends

PORT=${1:-3000}
SESSION_NAME="mdbook"
BOOK_DIR="/home/masud/projects/saf.ai/resiliate/book"

# Check if session already exists
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    echo "mdBook server is already running in tmux session '$SESSION_NAME'"
    echo "To view it: tmux attach -t $SESSION_NAME"
    echo "To stop it: ./mdbook-stop.sh"
    exit 0
fi

# Start new tmux session with mdbook
echo "Starting mdBook server on port $PORT..."
tmux new-session -d -s $SESSION_NAME "cd $BOOK_DIR && mdbook serve --hostname 0.0.0.0 --port $PORT"

# Get server IP
SERVER_IP=$(hostname -I | awk '{print $1}')
SERVER_NAME=$(hostname -f)

echo "mdBook server started successfully!"
echo "Access your book at:"
echo "  http://$SERVER_IP:$PORT"
echo "  http://$SERVER_NAME:$PORT (if DNS is configured)"
echo ""
echo "Firewall (UFW) should allow connections from 192.168.1.0/24 to port $PORT"
echo "If you need to configure it: sudo ufw allow from 192.168.1.0/24 to any port $PORT proto tcp"
echo ""
echo "To view the server output: tmux attach -t $SESSION_NAME"
echo "To detach from tmux (keep server running): Press Ctrl+B then D"
echo "To stop the server: ./mdbook-stop.sh"
