## 1. Boards
With telegraf and influxdb fully configured, open the *boards* on the sidebar on the left in the InfluxDB UI. Because we added the telegraf configuration for _System_, a board automatically got created for us. 

Open the *System* dashboard.


For this dashboard only one variable is configured. This is the bucket, here *my_bucket*, the bucket we are pushing the data from telegraf to.

In the graphs below we can see all the data that is getting collected and displayed as timeseries in basic graphs. You might not see any lines yet, but if you wait for a few minutes you can see the trends in all the graphs. Aside from the trend, the _System Uptime_, _nCPUs_, _System Load_ and _Total Memory_ are number values, that get refreshed in the same interval as the graphs, if they change.

### 1.1 Graphs
Now open the settings of any of the graphs (cog in the top right of it) and press *configure* to look at the structure behind it. 
The first thing is to select the type of graph at the top left. To fill the graph with data a query language called *Flux* is used.
 
>Flux is a standalone data scripting and query language that increases productivity and code reuse. Flux is optimized for ETL, monitoring, and alerting, with an inline planner and optimizer.
[[3]](https://www.influxdata.com/products/flux/).

A query usually consists of a source with _from_, a timerange with _range_, additional filters with _filter_ and aggregation functions like _mean_. If you are interested in a full syntax overview, visit the [official documentation](https://docs.influxdata.com/influxdb/v2.2/query-data/get-started/query-influxdb/).

Instead of writing the query one can also use a query builder, which might be easier to interact with but can have some limitations.

Now press *Submit* to save the graph.

### 1.2 Timeranges

Instead of the standard configuration of showing the past 1h, select *Past 5m*. Now you can see more information in the graphs and you can also set a custom refresh interval under *Enable Auto Refresh* to query the database more often and to have more frequent updates in the graph.

## 2. Explore
Instead of building a full dashboard you can also just explore and graph some data in a more experimental way under the *Explore* tab in the sidebar. This is basically the same thing as building a graph in a dashboard.

## 3. Books
Notebooks are a more advanced way to explore and visualize data. This is a more advanced way to process the data. If you are interested you can visit [this page](https://docs.influxdata.com/influxdb/v2.2/notebooks/create-notebook/). They also allow for alerts and automated tasks that get executed if specific requirements are met. For example: you can create an automated alert if the server uses more than 80% memory or has a very high cpu load. These help creating a proactive monitoring, which can be beneficial for time critical usecases. Simple tasks and alerts can also be created under *Tasks* and *Alerts* in the taskbar instead of inside a notebook.
