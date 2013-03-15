#!/bin/bash
cat events.org | grep -i $1 | tr -d ' ' | cut -f 2,5,6 -d '|' -s|tr '|' "\t"
