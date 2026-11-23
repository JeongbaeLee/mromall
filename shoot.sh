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
# v4 벤치마크 반영 화면
want detail     && shoot detail     "detail,f=galaxybook5" 1400 1500
want cart       && shoot cart       "cart" 1400 1700
want draft      && shoot draft      "cart,draft" 1400 1200
want order_appr && shoot order_appr "order,appr" 1400 1000
want fav        && shoot fav        "my,tab=fav" 1400 1300
want rfq        && shoot rfq        "my,tab=rfq" 1400 1300
want biz        && shoot biz        "my,tab=biz" 1400 900
want appr       && shoot appr       "admin,tab=appr" 1400 1700
want budget     && shoot budget     "admin,tab=budget" 1400 900
want members    && shoot members    "admin,tab=members" 1400 1000
want report     && shoot report     "admin,tab=report" 1400 1100
# v5 추가 요청 반영 화면
want tier       && shoot tier       "detail,f=postit654,q=50" 1400 1300
want pcmp       && shoot pcmp       "detail,f=lg_mon27q" 1400 1900
want compare    && shoot compare    "main,cmp=sam_mon27+lg_mon27q+lg_mon22+jooyon_monitor,cmpopen" 1400 1000
want order_buyer && shoot order_buyer "order,as=buyer" 1400 1500
want join       && shoot join       "main,join" 1400 1000
exit 0
