#!/bin/bash

# =================================================================
#The Architect: Directory Initialization
# =================================================================
initialize_system() {
    echo " [Architect] Checking and initializing directories..."
    mkdir -p active_logs archived_logs reports
    echo " [Architect] Setup verified."
    echo ""
}

# =================================================================
# The Security Lead: Your Component
# =================================================================
secure_data() {
    echo " [Security] Restricting 'active_logs' access to Owner only..."
    
    # Octal 700 grants Read, Write, and Execute to the Owner ONLY.
    chmod 700 active_logs
    
    echo " [Security] Directory permissions updated safely."
    echo " [Security] Live Permissions Audit Summary (ls -ld):"
    
    # -ld displays the permissions configuration of the directory itself
    ls -ld active_logs
    echo ""
}

# =================================================================
# The Orchestrator: Your Component
# =================================================================
main() {
    echo " Initializing Kenyatta National Hospital Digital Infrastructure..."
    echo "====================================================================="
    
    # 1. Automatically invoke Member 1's setup block
    initialize_system
    
    # 2. Automatically invoke Member 2's security block
    secure_data
    
    # 3. Print environment status with the dynamic system execution date
    echo "====================================================================="
    echo "System Environment Secured on $(date)"
    echo "====================================================================="
}

# Execute the orchestrator loop
main
