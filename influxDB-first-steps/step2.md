Now hop over to the "InfluxDB UI" tab and login with the credentials we created earlier.
 - username: "admin"
 - password: "adminpassword"

You will be greeted by the _Getting Started_ screen. Here select "Load your data" to continue with the scenario.

As you can see, there are many options for collecting data into the database. InfluxDB offers many libraries and plugins, aswell as good old CSV input.

For this scenario we will take a look at a prime example for using InfluxDB in a system monitoring usecase. To implement such a data collection, head over to the "Telegraf" tab at the top and press "create Configuration".

The bucket, that was created while making the docker container, is already selected. From the different options below, select "System" and press continue at the bottom.

Leave everything as is and click "Create and Verify".

