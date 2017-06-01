# TextThresher

An annotation interface for detailed text annotation by crowdworkers along researcher-defined topics of interest. Under development for the
[Deciding Force Project](http://www.decidingforce.org/). Currently, this app only runs locally.

# To setup

The app is run by Docker. If you do not have it already, you will need to install it.
* For OS X El Capitan 10.11 and later, get [Docker for Mac](https://docs.docker.com/docker-for-mac/).
* For earlier OS X, get [Docker Toolbox for Mac](https://docs.docker.com/toolbox/toolbox_install_mac/).
* For Windows 10 Pro, with Enterprise and Education (1511 November update, Build 10586 or later), get [Docker for Windows](https://docs.docker.com/docker-for-windows/).
* For Windows 7, 8.1 or other 10, get [Docker Toolbox for Windows](https://docs.docker.com/toolbox/toolbox_install_windows/).
* For Ubuntu and other Linux distributions, install
[docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/) and
[docker-compose](https://docs.docker.com/compose/install/).
  To [avoid having to use sudo when you use the docker command](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/create-a-docker-group),
create a Unix group called docker and add users to it:
  1. `sudo groupadd docker`
  2. `sudo usermod -aG docker $USER`

Once installed, start the Docker application (if on a Mac), then go to the project directory and run:

  1. `docker-compose pull` - To check for updated images
  2. `docker-compose up`

In a new shell window:

  1. `./init_docker.sh` # Inits Pybossa and loads all TextThresher sample data
  2. `./init_pybossa.sh` # Just init Pybossa
  3. `./init_django.sh` # two test users and two empty projects for TextThresher
  4. `./init_thresher.sh` # test users, test projects, and sample articles
  5. `./init_thresher.sh --with-annotations` # test users, sample articles, and quiz data

After the containers are running, you can go to:

  * http://localhost:3002/ - The Pybossa app
  * http://localhost:5000/researcher/ - The TextThresher app

After a while, you may want to reclaim the Gigs of space that Docker is using for old images.

  * `docker image prune` # Get rid of outdated images. Leave containers alone.
  * `docker system prune` # More aggressive clean, will get rid of stopped containers including data in Pybossa and TextThresher databases. May end up re-downloading current images. Run this with containers up and running to avoid over-pruning.

You will need to create a new account in Pybossa. A default admin 'nick' is set up for TextThresher.

Use `docker-compose stop` to stop the containers or `docker-compose down` to both stop and remove the containers.

## Docker Toolbox listens on different IP address

If you are running Docker Toolbox, you will have to enter `docker-machine ls` to find out what IP address your virtual machine is listening on.

You can open another terminal window and create a tunnel allowing use of localhost by entering `ssh -L 5000:192.168.99.100:5000 docker@192.168.99.100`. Substitute the IP address for your Docker virtual machine. The VM password is `tcuser`.

When using the Git Bash/Mingw command line, you must first:

```
source leave_paths_alone.sh
```

Otherwise you will get an error like this:
```
$ ./init_pybossa.sh
sh: 0: Can't open C:/Program Files/Git/ansible_build/init_db.sh
```
