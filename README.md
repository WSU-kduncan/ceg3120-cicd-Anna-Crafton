# Continuous Deployment Project Overview
The goal of this project is to run a DockerHub image on an AWS EC2 Instance. I used Docker, AWS, Ubuntu, DockerHub and Github. 

Docker is used to deploy images. 
This GitHub repo uses a workflow file to push images to DockerHub whenever it is updated. 
I used AWS to host an EC2 Instance to run an image from. 
Ubuntu was used to connect to the server. 

# Missing Diagram of Project

# Stuff that is not working. 

I had trouble getting Angular installed on the EC2 Instance.
It has docker and nodejs installed and is able to run dockers hello-world image, but since my image needs angular to run it does not work.  


# Resources Used
Article explaining semantic versioning > 

https://travishorn.com/semantic-versioning-with-git-tags-1ef2d4aeede6


Article explaining git tag commands > 

https://git-scm.com/book/en/v2/Git-Basics-Tagging


List of workflow triggers > 

https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows


Article on how to acess github info from a workflow > 

https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs#github-context


Article on fixing Docker Daemon Errors > 

https://www.howtogeek.com/devops/how-to-troubleshoot-cannot-connect-to-the-docker-daemon-errors/#permissions-issues)


Example Workflow >

https://github.com/pattonsgirl/CEG3120/blob/main/Projects/Project5/sample-workflows/docker-workflow-v2.yml

# README Files 

README-CI.md > 

First half of the project. This file is still missing documentation.

https://github.com/WSU-kduncan/ceg3120-cicd-Anna-Crafton/blob/main/README-CI.md


README-CD.md > 

Second half of project. The second part of this is not finished. 

https://github.com/WSU-kduncan/ceg3120-cicd-Anna-Crafton/blob/main/README-CD.md
