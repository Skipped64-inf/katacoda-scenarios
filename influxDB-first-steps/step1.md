This tutorial will focus on installing InfluxDB using the [official InfluxDB docker image](https://hub.docker.com/_/influxdb/).

## 1. Figuring out which version to install

For an easy and fast deployment process, we will use docker to install an instance of influxdb.

In this tutorial we will use version 2.2 but you can get a more recent one [here](https://hub.docker.com/_/influxdb/).

For Telegraf we will use version 1.22, the latest current version. Find more over at the official [Github](https://github.com/influxdata/telegraf).
We will install telegraf on the hostmachine instead of a docker container, because our goal is to monitor its resources and push them into the database. 
## 2. Installing InfluxDB with docker
 
`docker run -d --name=influxdb -p 8086:8086 -v $PWD/data:/var/lib/influxdb2 -v $PWD/config:/etc/influxdb2 -e DOCKER_INFLUXDB_INIT_MODE=setup -e DOCKER_INFLUXDB_INIT_USERNAME=admin -e DOCKER_INFLUXDB_INIT_PASSWORD=adminpassword -e DOCKER_INFLUXDB_INIT_ORG=DHBW -e DOCKER_INFLUXDB_INIT_BUCKET=my-bucket -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=mytoken12345token influxdb:2.2`{{execute}}

Let's take a look at what this command does:
 - 'docker run -d' means starting a container in detatched state (runs in the background, no direct console output).
 - '--name=influxdb' sets the container name to influxdb, this just makes it easier to work with the container later on.
 - the '-p 8086:8086' specifies the port mapping. Docker maps the port 8086 from inside the container to 8086 of localhost. The port on localhost can easily be swapped if already in use.
 - the '-v ...' parameters set specific docker volumes for the container. InfluxDB needs these to work properly.
 - all parameters with '-e ...' are for environment variables to preconfigure the credentials. We need these to access and push data to the database. Keep in mind these are not credentials you should use in production.
 - 'influxdb:2.2' specifies the image which docker should create the container from. In this case we want to set a version so it does not break any future deployments, if the version changes. If the image is not available/pulled locally, it pulls the image from the docker hub.

This will start the container and preconfigure our environment so we have the database ready and runnning. The database runs on port _8086_ per default and displays the web UI if you open it in a browser. The iframe above the terminal is already connected to the port and should display the login page. If not, refresh it via the button. 
## 3. Installing Telegraf on the host machine

Though we got the database running, we still need a tool to input data into the database. The choice when working with influxdb is telegraf, a popular choice as it integrates nicely into the influxdb stack and offers a wide variety of plugins.

`wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add - && source /etc/os-release && echo "deb https://repos.influxdata.com/${ID} ${VERSION_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list && sudo apt-get update && sudo apt-get install telegraf`{{execute}}

This adds the corresponding repo to our ubuntu machine and installs telegraf. For an installation on other systems visit [the installation page](https://docs.influxdata.com/telegraf/v1.22/install/).

## 4. Checking the installation

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


