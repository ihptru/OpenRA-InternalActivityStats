#!/bin/bash
# repository root directory without slash at the end
H='/Web/openra/sites/activity.openra.net/www'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export TZ='UTC'

FLAGS="\
--width 800 --height 240 
--lower-limit 0 
--color BACK#00000070 --color CANVAS#00000070 --color SHADEA#30303040 --color SHADEB#30303040 --color GRID#4242429f --color MGRID#424242 --color FONT#ffa000 --color FRAME#00000050 --color ARROW#ffa000 
--interlaced 
DEF:playing="$H/db/openra-players.rrd":playing:AVERAGE 
DEF:waiting="$H/db/openra-players.rrd":waiting:AVERAGE 
AREA:playing#ff2000a0:"playing":STACK 
AREA:waiting#af0000a0:"waiting":STACK 
"

rrdtool graph "$H/graph/players-hour.png" \
--start -1h --end now \
--x-grid SECOND:30:MINUTE:1:MINUTE:10:0:%M \
--title 'OpenRA players online (last hour)' \
$FLAGS

rrdtool graph "$H/graph/players-day.png" \
--start -1d --end now \
--x-grid MINUTE:30:HOUR:1:HOUR:1:0:%H \
--title 'OpenRA players online (last day)' \
$FLAGS

rrdtool graph "$H/graph/players-week.png" \
--start -1w --end now \
--x-grid HOUR:2:DAY:1:DAY:1:86400:%d \
--title 'OpenRA players online (last week)' \
$FLAGS

rrdtool graph "$H/graph/players-month.png" \
--start -1m --end now \
--x-grid DAY:1:DAY:7:DAY:7:86400:%d \
--title 'OpenRA players online (last month)' \
$FLAGS

rrdtool graph "$H/graph/players-year.png" \
--start -1y --end now \
--x-grid DAY:7:MONTH:1:MONTH:1:2592000:%m \
--title 'OpenRA players online (last year)' \
$FLAGS

rrdtool graph "$H/graph/players-10years.png" \
--start -10y --end now \
--x-grid MONTH:1:YEAR:1:YEAR:1:31536000:%Y \
--title 'OpenRA players online (last 10 years)' \
$FLAGS

date +'%Y-%m-%d %H:%M:%S' | tr -d "\n" > "${H}/log/redraw.ts"

