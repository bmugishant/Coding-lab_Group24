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
}

initialize_system
