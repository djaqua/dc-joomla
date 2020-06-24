# dc-joomla
docker-compose project for running a Joomla website

## Running the Website
To provide the highest availability for the current deployment paradigm, each 
of the containers is set to start automatically with the Docker service. This
can be observed by restarting the Docker service itself, or rebooting the host.

This is achieved with the container policy ["restart: always"][1]

A potentially useful alternative could be "restart: unless-stopped", which is
the same as "restart: always" except for when the containers are stopped 
manually.

## Deployment
For production, start by issuing the following command:
```Docker
./gen-env.sh    # generates .env file to be used by docker-compose
```

### Starting, Stopping, and Destroying Containers
To start the website (creating new containers if neccessary), issue the command:

```Docker
docker-compose up --detach website
```

To stop the containers (*without* destroying them), issue the command:
```Docker
docker-compose stop website
```

To stop and *destroy* the containers, **cautiously** use the command 
```Docker
docker-compose down website

```

## Configuring Joomla

### Step 1 - the Joomla Configuration screen
Field | Value
----- | -----
Site Name | the name of your website
Email | an email address for the website Super User
Username | a username for the website Super User
Password | a secure password for the website Super User
Site Offline | depends on your needs; the default is "No", but I generally like "Yes"

### Step 2 - the Joomla Database screen
Here are the sane values for the Database section of the Joomla Web Installer:

Field | Value
----- | -----
Database Type | MySQLi
Hostname | "joomladb" (or "database"))
Username | "root"
Password | "changeme" or the value of `MYSQL_ROOT_PASSWORD` from .env
Database Name | "joomla"
Table Prefix | leave as default

### Step 3 - the Joomla Overview screen
Defaults are fine, but for production deployment, it would probably be useful
to have the configuration send to you via email, so you may want to toggle 
"Email Configuration" in the Overview section.

### Step 4 - Finally
The Joomla Web Installer will promt you to remove the installation folder. 
Do it. To make a brand new website with a fresh database useful, click "Administrator." 
To verify that data from a previous Joomla installation is still intact, click "Site."

[1]: https://docs.docker.com/config/containers/start-containers-automatically/ "Start containers automatically"
[2]: https://docs.docker.com/compose/reference/up/ "docker-compose up"
