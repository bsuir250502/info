#!/bin/bash
./scoreboard.sh | sort -n -r | awk 'BEGIN {n = 1}
{ printf "%3d %10s %5d\n", n, $2, $1; n+=1 }'
