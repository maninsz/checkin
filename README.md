# checkin
CCCAT机场自动签到代码；
加入crontab定时任务，代码会在定时后的10分钟内随机时间签到；
脚本放在路由器上或者vps，确认已搭梯子了；
vps的话请安装uni2ascii，如果是路由器的话自行编译uni2ascii，否则改代码$(echo $unicode | ascii2uni -a U -q)直接改成"您已经签到过了"；
脚本会判断是否已经爬墙，会等待直到成功爬墙才会执行签到任务；
cookie请用Chrome F12调试获得签到的cookie；
用了server酱的微信提醒（签到了多少流量会微信通知），请填写自己的server_key.
