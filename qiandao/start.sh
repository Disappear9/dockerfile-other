#!/bin/sh

if [ $PORT ]; then
	sed -i 's/8923/$PORT/g' /app/config.py
fi

python /app/run.py

