#!/bin/bash

IP_ADDRESS="192.168.x.x"
PRIV_KEY="/home/user/.ssh/id_ed25519"

ssh null@$IP_ADDRESS -i $PRIV_KEY -o PasswordAuthentication=no
