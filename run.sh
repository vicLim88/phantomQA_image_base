#!/bin/bash

echo "[PhantomQA] Starting Xvfb on :1"
Xvfb :1 -screen 0 1920x1080x24 &
export DISPLAY=:1

echo "[PhantomQA] Starting LXDE session"
startlxde &

sleep 10

echo "[PhantomQA] Starting PhantomQA agent loop"
python3 agent/agent_loop.py
