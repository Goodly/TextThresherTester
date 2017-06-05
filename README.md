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
  2. `docker-compose up` - After about 10 seconds this window stops scrolling info, usually ending with 
  ```
  LOG:  autovacuum launcher started
  LOG:  database system is ready to accept connections
  ```
  Now TextThresher is running. Don't wait for a command prompt! Ctrl-C in this window will stop TextThresher.

**In a new shell window**:

  1. `source leave_paths_alone.sh` # Only need if using Docker Toolbox

Choose:

  2. `./init_docker.sh` # Inits Pybossa and loads all TextThresher sample data

or:

  2. `./init_pybossa.sh` # Just init Pybossa

and one of:

  3. `./init_django.sh` # two test users and two empty projects for TextThresher
  3. `./init_thresher.sh` # test users, test projects, and sample articles
  3. `./init_thresher.sh --with-annotations` # test users, sample articles, and quiz data

After initializing, *Docker Toolbox users* must enter:

  4. `./ssh_tunnel.sh` # to enable using `localhost`
      Enter `yes` to continue connecting. The VM password is `tcuser`.

Now you can go to:

  * http://localhost:3002/ - The Pybossa app
  * http://localhost:5000/researcher/ - The TextThresher app

After a while, you may want to reclaim the Gigs of space that Docker is using for old images.

  * `docker image prune` # Get rid of outdated images. Leave containers alone.
  * `docker system prune` # More aggressive clean, will get rid of stopped containers including data in Pybossa and TextThresher databases. May end up re-downloading current images. Run this with containers up and running to avoid over-pruning.

You will need to create a new account in Pybossa. A default admin 'nick' is set up for TextThresher.

Use `docker-compose stop` to stop the containers.
Enter `exit` in each terminal window. (Some may need more than one `exit` to unwind.)
Use `docker-compose down` to both stop and remove the containers. THIS DISCARDS THE TEXTTHRESHER and PYBOSSA DATABASES!

## Docker Toolbox notes

To stop the virtual machine providing Docker Toolbox services:

  * `docker-machine stop default`

So next time you want to run Docker you may need to:

  * `docker-machine start default`

n.b. If you forget `source leave_paths_alone.sh` when using GitBash, you will get an error like this:
```
$ ./init_pybossa.sh
sh: 0: Can't open C:/Program Files/Git/ansible_build/init_db.sh
```
