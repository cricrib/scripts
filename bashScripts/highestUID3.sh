awk 'BEGIN {FS=":"; max=0} $3 > max {max=$3} END {print "Max UID:",max}' /etc/passwd
