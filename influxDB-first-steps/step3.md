## 1. Boards
With telegraf and influxdb fully configured, open the *boards* on the sidebar on the left in the InfluxDB UI. Because we added the telegraf configuration for _System_, a board automatically got created for us. 

Open the *System* dashboard.


For this dashboard only one variable is configured. This is the bucket, here *my_bucket*, the bucket we are pushing the data from telegraf to.

In the graphs below we can see all the data that is getting collected and displayed as timeseries in basic graphs. You might not see any lines yet, but if you wait for a few minutes you can see the trends in all the graphs. Aside from the trend, the _System Uptime_, _nCPUs_, _System Load_ and _Total Memory_ are number values, that get refreshed in the same interval as the graphs, if they change.

### 1.1 Graphs
Now open the settings of any of the graphs (cog in the top right of it) to look at the structure behind it. A graph is based on a query in Flux.
 
>Flux is a standalone data scripting and query language that increases productivity and code reuse. Flux is optimized for ETL, monitoring, and alerting, with an inline planner and optimizer.
[[3]](https://www.influxdata.com/products/flux/).
