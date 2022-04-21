

This tutorial will focus on installing InfluxDB on ubuntu but you can also use the [official InfluxDB docker image](https://hub.docker.com/_/influxdb/).

## 1. Figuring out which version to install

For an easy and fast deployment process, we will use docker to install an instance of influxdb.

In this tutorial we will use version 2.2 but you can get a more recent one [here](https://hub.docker.com/_/influxdb/).

## 2. Creating a docker network

Because we are using docker, we first need to create a docker network. Containers by default can not communicate with each other, unless they are in the same docker network.
`docker network create --driver bridge influxdb-telegraf-net`{{execute}}
## 3. Installing InfluxDB with docker
 
`docker run -d -p 8086:8086 -v $PWD/data:/var/lib/influxdb2 -v $PWD/config:/etc/influxdb2 -e DOCKER_INFLUXDB_INIT_MODE=setup -e DOCKER_INFLUXDB_INIT_USERNAME=admin -e DOCKER_INFLUXDB_INIT_PASSWORD=adminpassword -e DOCKER_INFLUXDB_INIT_ORG=DHBW -e DOCKER_INFLUXDB_INIT_BUCKET=my-bucket -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=mytoken12345token --network influxdb-telegraf-net influxdb:2.2`{{execute}}

Let's take a look at what this command does:
 - 'docker run -d' means starting a container in silent mode (runs in the background).
 - the '-p 8086:8086' specifies the port mapping. Docker maps the port 8086 from inside the container to 8086 of localhost. The port on localhost can easily be swapped if already in use.
 - the '-v ...' parameters set specific docker volumes for the container. InfluxDB needs these to work properly.
 - all parameters with '-e ...' are for environment variables to preconfigure the credentials. We need these to access and push data to the database. Keep in mind these are not credentials you should use in production.
 - to be able to connect to telegraf, '--network influxdb-telegraf-net' adds the container to our network created in step 2.
 - 'influxdb:2.2' specifies the image which docker should run the container from. In this case we want to set a version so it does not break any future deployments if the version changes. If the image is not available/pulled locally, it pulls the image from the docker hub.

This will start the container and preconfigure our environment so we have the database ready and runnning.

Now we can check if the container is running:
`docker ps`{{execute}}

In this case, the container is running and we can test if our database accepts connections.
`curl localhost:8086`{{execute}}

We send a simple webrequest to the assigned port from the docker run command and we can see that the database is infact running on that port and returns a valid response on request.

## 4. Installing Telegraf with docker

Though we got the database running, we still need a tool to input data into the database. The choice when working with influxdb is telegraf. 
> Telegraf is a server-based agent for collecting and sending all metrics[...]. [[1]](https://www.influxdata.com/time-series-platform/telegraf/)

Telegraf needs a configuration file to match the influxdb credentials specified during installation. To make this scenario a little simpler i've already provided that configuration file. Let's take a look:
`cat telegraf.conf`{{execute}}

Token, organization and bucket need to be set as configured in the influxdb container.

`docker run -d --name=telegraf -v telegraf.conf:/var/lib/influxdb --net=influxdb-telegraf-net telegraf`{{execute}}

Finally, we can run the telegraf container.


## 3. Checking the installation




