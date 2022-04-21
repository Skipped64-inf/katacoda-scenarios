

This tutorial will focus on installing InfluxDB on ubuntu but you can also use the [official InfluxDB docker image](https://hub.docker.com/_/influxdb/).

## 1. Figuring out which version to install

For an easy and fast deployment process, we will use docker to install an instance of influxdb.

In this tutorial we will use version 2.2 but you can get a more recent one [here](https://hub.docker.com/_/influxdb/).

## 2. Creating a docker network

Because we are using docker, we first need to create a docker network. Containers by default can not communicate with each other, unless they are in the same docker network.
`docker network create --driver bridge influxdb-telegraf-net`{{execute}}
## 3. Installing InfluxDB with docker
 
`docker run -d --name=influxdb -p 8086:8086 -v $PWD/data:/var/lib/influxdb2 -v $PWD/config:/etc/influxdb2 -e DOCKER_INFLUXDB_INIT_MODE=setup -e DOCKER_INFLUXDB_INIT_USERNAME=admin -e DOCKER_INFLUXDB_INIT_PASSWORD=adminpassword -e DOCKER_INFLUXDB_INIT_ORG=DHBW -e DOCKER_INFLUXDB_INIT_BUCKET=my-bucket -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=mytoken12345token --network influxdb-telegraf-net influxdb:2.2`{{execute}}

Let's take a look at what this command does:
 - 'docker run -d' means starting a container in detatched state (runs in the background, no direct console output).
 - '--name=influxdb' sets the container name to influxdb, this just makes it easier to work with the container later on.
 - the '-p 8086:8086' specifies the port mapping. Docker maps the port 8086 from inside the container to 8086 of localhost. The port on localhost can easily be swapped if already in use.
 - the '-v ...' parameters set specific docker volumes for the container. InfluxDB needs these to work properly.
 - all parameters with '-e ...' are for environment variables to preconfigure the credentials. We need these to access and push data to the database. Keep in mind these are not credentials you should use in production.
 - to be able to connect to telegraf, '--network influxdb-telegraf-net' adds the container to our network created in step 2.
 - 'influxdb:2.2' specifies the image which docker should run the container from. In this case we want to set a version so it does not break any future deployments if the version changes. If the image is not available/pulled locally, it pulls the image from the docker hub.

This will start the container and preconfigure our environment so we have the database ready and runnning.
## 4. Installing Telegraf

Though we got the database running, we still need a tool to input data into the database. The choice when working with influxdb is telegraf. 
> Telegraf is a server-based agent for collecting and sending all metrics[...]. [[1]](https://www.influxdata.com/time-series-platform/telegraf/)

We will install telegraf on the hostmachine instead of a docker container, because our goal is to monitor system resources and fill them into the database.

`wget -qO- https://repos.influxdata.com/influxdb.key | sudo tee /etc/apt trusted.gpg.d/influxdb.asc >/dev/null && source /etc/os-release && echo "deb https://repos.influxdata.com/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list && sudo apt-get update && sudo apt-get install telegraf`{{execute}}

This adds the corresponding repo to our ubuntu machine and installs telegraf. For an installation on other systems visit [the installation page](https://docs.influxdata.com/telegraf/v1.22/install/).

## 3. Checking the installation

To make sure the installation went through, run:
`docker ps`{{execute}}

This outputs all running docker containers, here our influxdb container.

You can now test if the database is indeed running by calling the command:
`curl localhost:8086`{{execute}}
which should return some html output.
We send a simple webrequest to the assigned port from the docker run command and we can see that the database is infact running on that port and returns a valid response on request.
Another way to check if there are any errors is by looking at:
`docker logs influxdb`{{execute}}


Alright, logs looking good. On to the fun part!


