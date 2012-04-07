elinks -dump -dump-width 999 http://www.chromium.org/Home/chromium-security/hall-of-fame |echo $(grep 'Sergey Glazunov' |grep -o '$[0-9]*'|sed -e 's/\$//g' -e 's/$/+/g') 0|bc
