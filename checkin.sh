#!/bin/bash
while true
do
    sleep $(tr -cd '0-9' </dev/urandom | head -c 3) #
    ping -c 1 -w 8 t66y.com > /dev/null 2>&1
    if [[ $? != 0 ]];then
        sleep 180
    else
        cookie="Chrome用F12调试获得签到cookie"
        utf16=$(curl -s https://cccat.io/user/_checkin.php --cookie "$cookie")
        title="$(date +"%F") CCCAT签到"
        serverchan_sckey="yourself_server酱key"
        unicode=$(echo $utf16 | awk -F "[\"\"]" '{print $4}')
        content1="$(date +"%F %H:%M:%S") $(echo $unicode | ascii2uni -a U -q)"
        content2="$(date +"%F %H:%M:%S") 获得$(echo $unicode | cut -c19-25 |cut -d \M -f1)MB×110%流量"
        new=$(echo $utf16 | awk -F "[\"\"]" '{print $4}' | awk -F '\' '{print $2}')
      if [ "$new" = "u60a8" ]; then
          echo $content1 >> ~/cccat/checkin.log
          curl -s "https://sc.ftqq.com/$serverchan_sckey.send?text=$title" -d "&desp=$content1"
          exit
      else
          echo $content2 >> ~/cccat/checkin.log
          curl -s "https://sc.ftqq.com/$serverchan_sckey.send?text=$title" -d "&desp=$content2"
          exit
      fi
    fi
done
