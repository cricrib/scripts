#!/bin/bash
curl --silent http://www.chromium.org/Home/chromium-security/hall-of-fame |sed -e 's/<li>\$*/\
&/g'| echo $(grep 'Sergey Glazunov' |grep -o '$[0-9]*'|sed -e 's/\$//g' -e 's/$/+/g') 0|bc|sed 's/\([0-9]*\)/Sergey Glazunov won $\1/'
