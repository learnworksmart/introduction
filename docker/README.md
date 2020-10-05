# Introduction to Docker 
To demonstrate how we use simplify our web application deployment with Docker, we will be carried out the exercises in the following order:  
1. Deploy our web application on a local machine. 
1. Dockerised our web application and upload it to [Docker Hub](https://hub.docker.com/). 
	* Explain the use of Dockerfile. 
1. Deploy our web application via Docker on an EC2 instance. 
	* This shows how we easily deploy the same application in a different environment with Docker. 

## Pre-requisites
1. Sign up a [Docker Hub](https://hub.docker.com/) account. 
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop) on your local machine, and login with your Docker Hub account.
1. To run our web application we need to install [python3](https://www.python.org/downloads/) on our local machine  
1. Access to an Ubuntu EC2 instance which is [installed with docker](https://docs.docker.com/engine/install/ubuntu/). 
	* SSH key-based authentication is adopted for accessing the EC2 instance.

### Components (with version) used in this exercise
* EC2 AMI: `i-0c8e97a27be37adfd`
* (Local machine) Docker Desktop: `2.4.1`
* (Local machine) Python: `3.8.2`

## Deploy our web application on a local machine.
1. Download this repository onto our local machine: 
	* `git clone https://github.com/learnworksmart/introduction.git`
1. Browse to the `docker` -> `src` folder, which consist our web application setup files. 
1. Install the dependencies for our web application. 
	* `sudo pip3 install -r requirements.txt` 
1. Run our web application:
	* `export FLASK_APP=app`
	* `export FLASK_ENV=development`
	* `sudo python3 init_db.py`, this will create a `database.db` file. 
	* `sudo flask run --host=0.0.0.0 --port=80`
1. Open a web browser and visit our web application `http://127.0.0.1`.
1. Terminate the web application.  

## Dockerised our web application and upload it to **Docker Hub**
1. On our local machine, browse to the `docker` folder which consists of our `Dockerfile`. 
1. Build our docker image, for this exercise we name it as **sampleapp-docker-dev**:
	* `sudo docker build -t sampleapp-docker-dev .`
1. Create a container on our local machine, for this exercise we name it as **sampleapp**:
	* `sudo docker run --rm -it -p 80:80 --detach --name sampleapp sampleapp-docker-dev`
1. Open a web browser and visit our web application `http://127.0.0.1`
1. Stop and remove the container: 
	* `sudo docker rm sampleapp -f`

Login to [Docker Hub](https://hub.docker.com/) and create a new repository. For this exercise we will:
* use our docker hub username, which is **learnworksmart**
* name the repository as **newblog** and tag it as `dev`.
1. Upload our local image to **Docker Hub**
	1. `docker tag sampleapp-docker-dev learnworksmart/newblog:dev`
	1. `docker push learnworksmart/newblog:dev`
1. Visit your **Docker Hub newblog** respository and you should see the upload docker image. 

## Deploy our web application via Docker on an EC2 instance.
1. Access our EC2 instance, and verify that **docker** has been installed. 
	* `which docker`
1. Download the docker image and run it as a container: 
	* `docker pull learnworksmart/newblog:dev`
	* `docker run --rm -it -p 80:80 --detach --name app learnworksmart/newblog:dev` 
