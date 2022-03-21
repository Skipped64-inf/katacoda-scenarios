

This tutorial will focus on installing InfluxDB on ubuntu but you can also use the [official InfluxDB docker image](https://hub.docker.com/_/influxdb/).

## 1. Downloading the binary file

In this tutorial we will use version 2.1.1 but you can get a more recent one [here](https://docs.influxdata.com/influxdb/latest/).


`wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.1.1-linux-amd64.tar.gz`{{execute}}

## 2. Extracting the file
 
After downloading the binaries we will use the _tar_ tool to extract the files.

`tar xvzf path/to/influxdb2-2.1.1-linux-amd64.tar.gz` {{execute}
}

## 3. Starting the database

Now we are ready to start the daemon.

`./influxd`{{execute}}

This is it for the first step, next we will look at how to set up the database.
