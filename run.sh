#!/bin/bash

set -e

echo "[PhantomQA-Base]  Starting Agent Loop..."
python3 agent/agent_loop.py

# echo "[PhantomQA-Base]  Ensure you have the required environment variables set in .env file."
# if [ ! -f .env ]; then
#     echo "[PhantomQA-Base]  .env file not found! Please create one with the necessary environment variables."
#     exit 1
# fi
# source .env
# python3 agent/agent_loop.py