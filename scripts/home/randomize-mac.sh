#!/bin/bash

interface="enp7s0"

#-------------------------------------------------------------------------------

if [ $(id -u) -ne 0 ]; then
    echo "This script must be ran as root."
    exit 1
fi

#-------------------------------------------------------------------------------

assert_command() {
    if [ ! $(command -v $1) ]; then
        echo "The \"$1\" command is not installed."
        exit 1
    fi
}

assert_command "ip"
assert_command "macchanger"

#-------------------------------------------------------------------------------

ip a
echo
read -p "Randomizing interface \"$interface\". Press any key to continue..."

echo -n "Bringing interface down... "
ip link set $interface down
echo "Done."

macchanger -a $interface

echo -n "Bringing interface up... "
ip link set $interface up
echo "Done."
