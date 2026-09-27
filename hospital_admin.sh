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
echo "Initialization complete."

}

# TODO: Member 2 - replace this placeholder with the real secure_data()function
secure_data() {
     chmod 700 active_logs
    echo "Permissions updated for active_logs:"
    ls -l active_logs

     }
     main() { 
         initialize_system
         secure_data
         echo "System Environment Secured"
         date
}
main
