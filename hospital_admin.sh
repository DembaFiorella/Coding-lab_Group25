#!/bin/bash



initialize_system() {

    echo "Checking hospital directories..."



    if [ ! -d "active_logs" ]; then

        mkdir active_logs

        echo "Created active_logs directory."

    else

        echo "active_logs directory already exists."

    fi



    if [ ! -d "archived_logs" ]; then

        mkdir archived_logs

        echo "Created archived_logs directory."

    else

        echo "archived_logs directory already exists."

    fi



    if [ ! -d "reports" ]; then

        mkdir reports

        echo "Created reports directory."

    else

        echo "reports directory already exists."

    fi

}



secure_data() {

    chmod 700 active_logs

    echo "Active logs permissions secured:"

    ls -ld active_logs

}



# Execute the system setup

initialize_system

secure_data



echo "System Environment Secured"

echo "Date: $(date)"
