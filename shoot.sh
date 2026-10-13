#!/bin/bash
# 헤드리스 Chrome 캡처: bash shots/shoot.sh [name ...]  (인자 없으면 전체)
CH="/c/Program Files/Google/Chrome/Application/chrome.exe"
D="C:/Users/NHN/_bmad/mro-mall"
F="PAYCO_MRO몰_목업.html"
shoot(){ # name hash w h
  "$CH" --headless=new --disable-gpu --hide-scrollbars --no-first-run --virtual-time-budget=8000 --window-size=$3,$4 --user-data-dir="C:/Users/NHN/AppData/Local/Temp/chp_mro_$RANDOM" --screenshot="$D/shots/$1.png" "file:///$D/$F#$2" >/dev/null 2>&1
  echo "$1 $(stat -c %s "$D/shots/$1.png" 2>/dev/null)"
}
want(){ [ $# -eq 0 ] || [[ " $ARGS " == *" $1 "* ]]; }
ARGS="$*"
[ -z "$ARGS" ] && set --
want illus  && shoot illus  "illus,clean" 1600 1500
want main   && shoot main   "main" 1400 2050
want order  && shoot order  "order" 1400 2700
want order_card && shoot order_card "order,card" 1400 2100
want order_cash && shoot order_cash "order,cash" 1400 2300
want guide  && shoot guide  "order,guide" 1400 1000
want done   && shoot done   "order,done" 1400 1000
want panel  && shoot panel  "order,panel" 1400 1000
