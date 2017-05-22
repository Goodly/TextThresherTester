# TextThresher

An annotation interface for detailed text annotation by crowdworkers along researcher-defined topics of interest. Under development for the
[Deciding Force Project](http://www.decidingforce.org/). Currently, this app only runs locally.

# To setup

The app is run by Docker. If you do not have it already, you will need to install it.
* For OS X, go [here](https://docs.docker.com/docker-for-mac/).
* For Windows, go [here](https://docs.docker.com/docker-for-windows/).
* For Ubuntu and other Linux distributions, install
[docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/) and
[docker-compose](https://docs.docker.com/compose/install/).
  To [avoid having to use sudo when you use the docker command](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/create-a-docker-group),
create a Unix group called docker and add users to it:
  1. `sudo groupadd docker`
  2. `sudo usermod -aG docker $USER`

Once installed, start the Docker application (if on a Mac), then go to the project directory and run:

  1. `docker-compose up`

In a new shell window:
  2. `./init_pybossa.sh`
  3. `./init_django.sh`

After the containers are running, you can go to:

  * http://localhost:3002/ - They Pybossa app
  * http://localhost:5000/researcher/ - The TextThresher app

You will need to create a new account in Pybossa. A default admin 'nick' is set up for TextThresher.

Use `docker-compose stop` to stop the containers or `docker-compose down` to both stop and remove the containers.
