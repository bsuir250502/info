#!/bin/bash
for s in $(./surnames.sh); do
  echo $(./score.sh $s|tail -1) $s
done
