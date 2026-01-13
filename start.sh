#!/bin/bash

echo "[Validator] Starting the validator service..."

# Ensure .env exists
if [ ! -f .env ]; then
    echo "[WARN] .env file not found. Proceeding with system environment variables."
fi

## PID locking Not needed in docker 

#echo $$ >> lock.pid
#lockedby=`head -1 lock.pid`
#if [ $$ != $lockedby ] ; then
#    kill -9 $lockedby
#    echo $$ > lock.pid
#    echo "Murdered $lockedby because it had the lock"
#fi

#rm lock.pid

# Run orchestrator logic
echo "[Validator] Starting Orchestrator..."
npm start
