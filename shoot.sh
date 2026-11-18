#!/bin/bash
# 헤드리스 Chrome 캡처: bash shots/shoot.sh [name ...]  (인자 없으면 전체)
CH="/c/Program Files/Google/Chrome/Application/chrome.exe"
D="C:/Users/NHN/_bmad/mro-mall"
F="PAYCO_MRO몰_목업.html"
shoot(){ # name hash w h
  "$CH" --headless=new --disable-gpu --hide-scrollbars --no-first-run --virtual-time-budget=9000 --window-size=$3,$4 --user-data-dir="C:/Users/NHN/AppData/Local/Temp/chp_mro_$RANDOM" --screenshot="$D/shots/$1.png" "file:///$D/$F#$2" >/dev/null 2>&1
  echo "$1 $(stat -c %s "$D/shots/$1.png" 2>/dev/null)"
}
ARGS=" $* "
want(){ [ "$ARGS" = "  " ] || [[ "$ARGS" == *" $1 "* ]]; }
want main       && shoot main       "main,slide=0" 1400 3300
want main_cat   && shoot main_cat   "main,cat,slide=1" 1400 900
want order      && shoot order      "order" 1400 2900
want order_card && shoot order_card "order,card" 1400 2300
want quote      && shoot quote      "order,quote" 1400 1100
want done       && shoot done       "order,done" 1400 1000
want guide      && shoot guide      "order,guide" 1400 1000
want order_cash && shoot order_cash "order,cash" 1400 2300
want my         && shoot my         "my,placed" 1400 1200
exit 0
