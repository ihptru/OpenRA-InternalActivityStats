#!/bin/bash
# repository root directory without slash at the end
H='/home/resource/sites/activity.openra.net/www'

STAT=($(php "${H}/bin/getstat.php" 2>/dev/null))

if [ "${STAT[0]}" = "" ]; then
    exit -1
fi

rrdtool update "${H}/db/openra-players.rrd" "N:${STAT[0]}:${STAT[1]}"
echo rrdtool update "${H}/db/openra-players.rrd" "$(date +'%s'):${STAT[0]}:${STAT[1]}" >> "${H}/db/log"

