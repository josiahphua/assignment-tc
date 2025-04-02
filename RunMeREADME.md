# README

## Overview
This project includes a script named `run.sh` designed to simplify the execution of tasks related to this project.

## Prerequisites
Ensure you have the following before running the script:
- A Unix-based operating system (Linux or macOS).
- Bash shell installed (`bash --version` to check).
- Necessary dependencies for the project (if any).

## Usage
1. Open a terminal and navigate to the project directory:
    ```bash
    cd ~/assignment-tc
    ```

2. Make the script executable (if not already):
    ```bash
    chmod +x run.sh
    ```

3. Start all services:
    ```bash
    ./run.sh start
    ```
   
4. Stop all services:
    ```bash
    ./run.sh stop
    ```
   
5. Restart all services (rebuild + relaunch):
    ```bash
    ./run.sh restart
    ```
   
6. View logs for all services:
    ```bash
    ./run.sh logs
    ```
   

## Customization
You can modify the `run.sh` script to suit your specific needs. Open it in a text editor and adjust the commands or parameters as required.

## Troubleshooting
- If you encounter a "Permission denied" error, ensure the script is executable using the `chmod +x run.sh` command.
- Check the script for any required dependencies or environment variables.  