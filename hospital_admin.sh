#!/bin/bash

#!/bin/bash

initialize_system() {
    echo "Initializing KNH Digital Infrastructure..."

    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir active_logs
    else
        echo "active_logs already exists. Skipping."
    fi

    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    else
        echo "archived_logs already exists. Skipping."
    fi

    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir reports
    else
        echo "reports already exists. Skipping."
fi

}

initialize_system
