

This tutorial will focus on installing InfluxDB on ubuntu but you can also use the [official InfluxDB docker image](https://hub.docker.com/_/influxdb/).

## 1. Figuring out which version to install

For an easy and fast deployment process, we will use docker to install an instance of influxdb.

In this tutorial we will use version 2.2 but you can get a more recent one [here](https://hub.docker.com/_/influxdb/).

## 2. Running the docker command
 
`docker run -d -p 8086:8086 -v $PWD/data:/var/lib/influxdb2 -v $PWD/config:/etc/influxdb2 -e DOCKER_INFLUXDB_INIT_MODE=setup -e DOCKER_INFLUXDB_INIT_USERNAME=admin -e DOCKER_INFLUXDB_INIT_PASSWORD=admin -e DOCKER_INFLUXDB_INIT_ORG=DHBW -e DOCKER_INFLUXDB_INIT_BUCKET=my-bucket influxdb:2.2`{{execute}}

Let's take a look at what this command does:
 - 'docker run -d' means starting a container in silent mode (runs in the background).
 - the '-p 8086:8086' specifies the port mapping. Docker maps the port 8086 from inside the container to 8086 of localhost. The port on localhost can easily be swapped if already in use.
 - the '-v ...' parameters set specific docker volumes for the container. InfluxDB needs these to work properly.
 - all parameters with '-e ...' are for preconfiguring the user. Specifically the DOCKER_INFLUXDB_INIT_USERNAME and DOCKER_INFLUXDB_INIT_PASSWORD are important to be able to connect to it later. 
 - 'influxdb:2.2' specifies the image which docker should run the container from. In this case we want to set a version so it does not break any future deployments if the version changes. If the image is not available/pulled locally, it pulls the image from the docker hub.
## 3. Starting the database




