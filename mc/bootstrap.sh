#!/bin/bash
if [ $# -eq 0 ]; then
    echo "usage: ./bootstrap.sh user@hostname"
    exit 0
fi

ssh $1 'mkdir /root/mc/ && mkdir /root/mc/data'
scp ./docker-compose.yml $1:/root/mc/docker-compose.yml
scp ./data/icon.png $1:/root/mc/data/icon.png
ssh $1 'cd /root/mc/ && docker compose up -d'
