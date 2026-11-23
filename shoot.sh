#!/bin/bash
# 헤드리스 Chrome 캡처: bash shots/shoot.sh [name ...]  (인자 없으면 전체)
CH="/c/Program Files/Google/Chrome/Application/chrome.exe"
D="C:/Users/NHN/_bmad/mro-mall"
F="PAYCO_MRO몰_목업.html"
shoot(){ # name hash w h [scale]
  "$CH" --headless=new --disable-gpu --hide-scrollbars --no-first-run --virtual-time-budget=9000 --force-device-scale-factor=${5:-1} --window-size=$3,$4 --user-data-dir="C:/Users/NHN/AppData/Local/Temp/chp_mro_$RANDOM" --screenshot="$D/shots/$1.png" "file:///$D/$F#$2" >/dev/null 2>&1
  echo "$1 $(stat -c %s "$D/shots/$1.png" 2>/dev/null)"
}
ARGS=" $* "
want(){ [ "$ARGS" = "  " ] || [[ "$ARGS" == *" $1 "* ]]; }
want main       && shoot main       "main,slide=0" 1400 5600
want main_cat   && shoot main_cat   "main,cat,slide=1" 1400 900
want list       && shoot list       "list,k=0" 1400 1500
want order      && shoot order      "order" 1400 3300
want order_card && shoot order_card "order,card" 1400 2500
want quote      && shoot quote      "order,quote=bit" 1400 1300
want done       && shoot done       "order,done" 1400 1000
want guide      && shoot guide      "order,guide" 1400 1000
want my         && shoot my         "my" 1400 2200
want doc_stmt   && shoot doc_stmt   "my,doc=stmt" 1400 1300
want doc_dlv    && shoot doc_dlv    "my,doc=dlv" 1400 1300
exit 0
