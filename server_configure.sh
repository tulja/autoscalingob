#!/bin/bash

# echo $new_key > /home/ubuntu/config

echo "starting iperf client"
screen -d -m -S client iperf -c $server_private -t 1200
echo "started iperf client"
