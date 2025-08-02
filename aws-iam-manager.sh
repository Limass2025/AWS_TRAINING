#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

# Define IAM User Names Array
IAM_USER_NAMES=("user1" "user2" "user3" "user4" "user5")

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"
    
    # Iterate through the array and create each user
    for user_name in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $user_name"
        aws iam create-user --user-name "$user_name"
        
        if [ $? -eq 0 ]; then
            echo "Success: User '$user_name' created."
        else
            echo "Error: Failed to create user '$user_name'. It may already exist."
        fi
    done
    
    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

# Function to create admin group and attach policy
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"
    
    # Check if group already exists to prevent an error
    aws iam get-group --group-name "admin" >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Creating IAM group: admin"
        aws iam create-group --group-name "admin"
        if [ $? -eq 0 ]; then
            echo "Success: IAM group 'admin' created."
        else
            echo "Error: Failed to create group 'admin'."
            exit 1
        fi
    else
        echo "IAM group 'admin' already exists. Skipping creation."
    fi
    
    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    # AWS-managed policy ARN for AdministratorAccess
    ADMIN_POLICY_ARN="arn:aws:iam::aws:policy/AdministratorAccess"
    aws iam attach-group-policy --group-name "admin" --policy-arn "$ADMIN_POLICY_ARN"
    
    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy"
    fi
    
    echo "----------------------------------"
    echo ""
}

# Function to add users to admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"
    
    # Iterate through the array and add each user to the admin group
    for user_name in "${IAM_USER_NAMES[@]}"; do
        echo "Adding user '$user_name' to group 'admin'."
        aws iam add-user-to-group --group-name "admin" --user-name "$user_name"
        
        if [ $? -eq 0 ]; then
            echo "Success: User '$user_name' added to group 'admin'."
        else
            echo "Error: Failed to add user '$user_name' to group 'admin'. User or group may not exist."
        fi
    done
    
    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main execution function
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""
    
    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install and configure it first."
        exit 1
    fi
    
    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group
    
    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0
