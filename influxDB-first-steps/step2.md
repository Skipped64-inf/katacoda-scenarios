Now hop over to the [InfluxDB UI](https://[[HOST_SUBDOMAIN]]-8086-[[KATACODA_HOST]].environments.katacoda.com/) tab and login with the credentials we created earlier.
 - username: `admin`{{copy}}
 - password: `adminpassword`{{copy}}

You will be greeted by the _Getting Started_ screen. Here select "Load your data" to continue with the scenario.

As you can see, there are many options for collecting data into the database. InfluxDB offers many libraries and plugins, aswell as good old CSV input.

For this scenario we will take a look at a prime example for using InfluxDB in a system monitoring usecase. To implement such a data collection, head over to the "Telegraf" tab at the top and press "create Configuration".

The bucket, that was created while making the docker container, is already selected. From the different options below, select "System" and press continue at the bottom.

Leave everything as is and click "Create and Verify".

Before finishing the configuration, two lines of code will be displayed. Copy the first line to clipboard and paste it into the Terminal tab at the bottom. This sets our token so we are authorized to access the api with Telegraf.

Finally copy the second line of code and also paste it into the terminal. This starts telegraf with a custom config file that we created by clicking through the UI at the top. 

To check the connection press the "Listen for Data" Button in the UI and wait for it to recieve data (it sometimes takes a short time to register the connection).

Click finish. This completes our configuration.