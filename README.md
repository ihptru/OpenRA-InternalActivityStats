OpenRA-InternalActivityStats
============================
This is a set of scripts used to gather and build Master Server Playing/Waiting Activity statistics over time.
###crontab:
```
*       * * * * /path/to/update_graphdb.sh
*       * * * * sleep 30 && /path/to/update_graphdb.sh
*       * * * * sleep 5  && /path/to/draw_graph.sh >/dev/null 2>&1
```

Result is a set of png files and html page to display them.
