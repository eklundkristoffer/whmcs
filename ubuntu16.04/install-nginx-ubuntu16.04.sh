#!/bin/bash
sudo apt-get update
sudo apt-get install nginx

while [ ! $# -eq 0 ]
do
    case "$1" in
        --ufw | -h)
            sudo ufw allow 'Nginx HTTP'
            sudo ufw status
            exit
            ;;
    esac
    shift
done