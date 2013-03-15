./events_by.sh $1 |awk '
BEGIN {result=0}
      { delta = $2 * $3; printf delta " "; result += delta }
END   { print "\n----" ; print result }
'
