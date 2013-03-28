#!/bin/bash

surnames(){
    cat students.txt|sed "s/ +/ /;s/-/ /"|cut -f 1 -d ' '
}

events_by(){
    cat events.org | grep -i $1 | tr -d ' ' | cut -f 2,5,6 -d '|' -s|tr '|' "\t"
}

score() {
    events_by $1 |awk '
BEGIN { result=0 }
      { delta = $2 * $3; printf delta " "; result += delta }
END   { print "\n----" ; print result }
'
}

scoreboard(){
    for s in $(surnames); do
        echo $(score $s | tail -1) $s
    done
}

rating(){
    scoreboard | sort -n -r | awk 'BEGIN {n = 1}
{ printf "%3d %10s %5d\n", n, $2, $1; n+=1 }'
}

rating
