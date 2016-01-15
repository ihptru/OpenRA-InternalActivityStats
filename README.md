OpenRA-InternalActivityStats
============================
This is a set of scripts used to gather and build Master Server Playing/Waiting Activity statistics over time.
###crontab:
```
*       * * * * /path/to/bin/update_graphdb.sh
*       * * * * sleep 30 && /path/to/bin/update_graphdb.sh
*       * * * * sleep 5  && /path/to/bin/draw_graph.sh >/dev/null 2>&1
```

Result is a set of png files and html page to display them.


Before setting up cron, edit "H" variable in bin/draw_graph.sh and bin/update_graphdb.sh

* Uptime: http://stats.pingdom.com/syygqlg6525r/1950684
