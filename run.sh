#!/bin/bash

# Define paths
BACKEND_DIR="tc-backend"
FRONTEND_DIR="tc-frontend"
NETWORK_NAME="tc-network"

# Function to create a Docker network if it doesn't exist
create_network() {
    if ! docker network inspect "$NETWORK_NAME" &>/dev/null; then
        echo "Creating Docker network: $NETWORK_NAME"
        docker network create "$NETWORK_NAME"
    fi
}

# Function to start all services
start() {
    echo "Starting backend and frontend..."
    create_network
    (cd "$BACKEND_DIR" && docker-compose up -d)
    (cd "$FRONTEND_DIR" && docker-compose up -d)
    echo "Services are running!"
    echo "- Backend API: http://localhost:3001"
    echo "- Frontend App: http://localhost:8080"
}

# Function to stop all services
stop() {
    echo "Stopping backend and frontend..."
    (cd "$BACKEND_DIR" && docker-compose down)
    (cd "$FRONTEND_DIR" && docker-compose down)
    echo "Services stopped."
}

# Function to rebuild and restart
restart() {
    stop
    start
}

# Function to view logs
logs() {
    echo "Tailing logs (Ctrl+C to exit)..."
    (cd "$BACKEND_DIR" && docker-compose logs -f) &
    (cd "$FRONTEND_DIR" && docker-compose logs -f) &
    wait
}

# Main command handler
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    logs)
        logs
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|logs}"
        exit 1
        ;;
esac