#!/bin/bash
cat students.txt|sed "s/ +/ /;s/-/ /"|cut -f 1 -d ' '
