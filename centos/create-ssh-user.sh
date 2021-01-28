#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd test
SSH_USERPASS=test
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin test)
echo ssh user password: $SSH_USERPASS
echo 'root:Passw0rd' | chpasswd
}

# Call all functions
__create_user