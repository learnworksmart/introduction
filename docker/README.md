# Introduction to Docker 
This exercise is to demonstrate how we can use Docker to manage and simplify the deployment for our web application. 
It will be carried out in the follow manager:  
1. Deploy our web application on a local machine. 
1. Dockerised our web application and upload it to [Docker Hub](https://hub.docker.com/).  
1. Deploy our web application via Docker on an EC2 instance. 

## Pre-requisites
1. Sign up a Docker Hub account. 
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop) on your local machine, and login with your docker account.
1. Install [python3](https://www.python.org/downloads/) on your local machine.  
1. Access to an Ubuntu EC2 instance which is [installed with docker](https://docs.docker.com/engine/install/ubuntu/). 
	* SSH key-based authentication is adopted for accessing the EC2 instance.

### Deploy our web application on a local machine.
1. Download this repository onto our local machine: 
	* `git clone https://github.com/learnworksmart/introduction.git`
1. Browse to the `docker` -> `src` folder, which consist our web application setup files. 
1. Install the dependencies for our web application. 
	* `sudo pip3 install -r requirements.txt` 
1. Run our web application:
	* `export FLASK_APP=app`
	* `export FLASK_ENV=development`
	* `python3 init_db.py`, this will create a `database.db` file. 
	* `flask run --host=0.0.0.0 --port=80`
1. Open a web browser and visit our web application `http://127.0.0.1`.
1. Terminate the the web application.  

### Dockerised our web application and upload it to **Docker Hub**
1. On our local machine, browse to the `docker` folder which consists of our `Dockerfile`. 
1. Build our docker image, for this exercise we name it as **python-docker-dev**:
	* `docker build -t python-docker-dev`
1. Create a container on our local machine, for this exercise we name it as **sampleapp**:
	* `docker run --rm -it -p 80:80 --detach --name sampleapp python-docker-dev`
1. Open a web browser and visit our web application `http://127.0.0.1`
1. Stop and remove the container: 
	* `docker rm sampleapp -f`

Login to [Docker Hub](https://hub.docker.com/) and create a new repository. For this exercise we will:
	* use our docker hub username, which is **learnworksmart**
	* name the repository as **newblog** and tag it as `dev`.
1. Upload our local image to **Docker Hub**
	1. `docker tag python-docker-dev learnworksmart/newblog:dev`
	1. `docker push learnworksmart/newblog:dev`
1. Visit your **Docker Hub newblog** respository and you should see the upload docker image. 

### Deploy our web application via Docker on an EC2 instance.
1. Access our EC2 instance, and verify that **docker** has been installed. 
	* `which docker`
1. Download the docker image and run it as a container: 
	* `docker pull learnworksmart/newblog:dev`
	* `docker run --rm -it -p 80:80 --detach --name app learnworksmart/newblog:dev` 
