#!/bin/ash

# turn on ash's job control
set -m

# Start the nats-server and put it in the background
nats-server -c nats-server.conf &

sleep 5

# Start liftbridge
liftbridge --raft-bootstrap-seed

fg %1