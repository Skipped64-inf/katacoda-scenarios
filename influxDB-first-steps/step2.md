Now look at the upper tab,  the [InfluxDB UI](https://[[HOST_SUBDOMAIN]]-8086-[[KATACODA_HOST]].environments.katacoda.com/), and login with the credentials we created earlier.
 - username: `admin`{{copy}}
 - password: `adminpassword`{{copy}}

## 1. Getting started
You will be greeted by the _Getting Started_ screen. Here select *Load your data* to continue with the scenario.

As you can see, there are many options for collecting data into the database. InfluxDB offers many libraries and plugins, aswell as good old CSV input.

## 2. Using Telegraf as datasource
For this scenario we will take a look at a prime example for using InfluxDB in a system monitoring usecase. To implement such a data collection, head over to the *Telegraf* tab at the top and press *create Configuration*.

The bucket, that was created while making the docker container, is already selected. From the different options below, select *System* and press *Continue* at the bottom.
Here one could use many many different plugins and languages to collect and push data into the database. To make things easy to setup, we will just use the system resources, which are ofcourse ready and available to be monitored.

For the plugin config, leave everything as is and click *Create and Verify*.

## 3. Configuring and starting Telegraf
Before finishing the configuration, two lines of code will be displayed. Copy the first line to clipboard and paste it into the Terminal tab at the bottom. This sets our token so we are authorized to access the api with Telegraf.

Finally copy the second line of code and also paste it into the terminal. This starts telegraf with a custom config file that we created by clicking through the UI at the top and telegraf is now connected to influxdb.

# 4. Checking connection and configuration

To check the connection press the *Listen for Data* Button in the UI and wait for it to recieve data (it sometimes takes a short time to register the connection).

Click *Finish*. This completes our configuration.