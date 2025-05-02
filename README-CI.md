## crafton-project4-ceg3121

## PART 1

# Docker Installation How-To:

1) Download Docker for Windows from https://www.docker.com/ and follow the prompts on the installer. 
2) Do docker --version in powershell to make sure it is installed correctly.

Note: I already had an older version of docker installed for a previous project, so it is possable I misssed somthing here. 
  
![image](https://github.com/user-attachments/assets/410dd96c-bde8-4160-acc7-9dea1256ab6a)

# Running a Docker Container:

To make sure everthing was working, I ran a pre-existing hello-world container. I used instructions from https://www.geeksforgeeks.org/docker-hello-world/, which had me
pull the continer and then run it. 

  `docker pull hello-world`
  `docker run hello-world`

Once Docker was working, I ran the angular-site aplication that was given as part of the project. 

1) I installed angular and node js. 
    -  I navigated to /angular-site/wsu-hw-ng-main and installed angular with npm. This worked on the first try.
    -  I already had an older version node js installed on my computer, but the aplication would not compile without at least version 18. 
    -  Itried updating it, which did not work initially because the public wifi network I was using blocked the download. I was able to update it at  home using nvm. 

2) I navigated to wsu-hw-ng-main and ran ng serve -host 0.0.0.0 to compile. 
   - I enabled autocompletion when prompted. I have googled this and still do not know what this means, but it does not seem to have affected anything so far.
     
3) To confirm that the aplication was working, I followed the instructions in the terminal and went to http://localhost:4200/, which showed a fancy looking bird website.


![image](https://github.com/user-attachments/assets/84671484-acba-47ad-bc07-4ec936c4a49a)


![image](https://github.com/user-attachments/assets/2fb7a683-7e9b-4e15-8fe0-12ccb068e881)


# Creating a Dockerfile:

- The file is based heavily on the dev.to link given in the project overview.
- I ended up removing several lines later since they were causing errors.

  The Dockerfile ended up being five lines.
  It uses node:alpine as a base image, and copies the files from the given wsu-hw-ng-main folder to the app folder in the angular apllication.
  It installs angular with npm, and then serves the application on 0.0.0.0. 
  
'''
FROM node:alpine 
WORKDIR angular-site/wsu-hw-ng-main
COPY . /usr/src/app
RUN npm install -g @angular/cli
CMD ["ng", "serve", "--host", "0.0.0.0"]
'''

# Building an Image:

- For this section, I followed the instructions in the dev.io link given in the project overview.

1) Create new angular aplication called angular-docker, and then started it in the terminal. 

2) Build the aplication. (I ran into some issues here but was able to resolve them)
   
- When I first tried to build the aplication, I got an error saying "The command 'docker' could not be found in this WSL 2 distro.
  We recommend to activate the WSL integration in Docker Desktop settings."

  To fix this, I went to Docker Desktop and navigated to the settings button in the top right. I changed the WSL integration settings, and then restarted Docker. 

  ![image](https://github.com/user-attachments/assets/3eebf4fb-7bb9-496a-83f1-c6524748785b)

- I had several errors relating to the semantics of my Docker file, which I fixed by putting a space between 'CMD' and '[]' in the last line.
  I also ended up removing several RUN lines. The Dockerfile still installs angular, but nothing else.

  Commmands to actually build the application after fixing all the errors:
  
    1) npm start (from the angular-docker folder!)
       
    3) docker build -t angular-docker . (from a new terminal!)
       
    5) docker images (to check that the image has been created)

![image](https://github.com/user-attachments/assets/5ce5ad2c-d9dc-46d3-90cc-0fe9ff9a9781)

# Building a Container 

- Despite being able to run the hello-world continer earlier in the project, I ran into issues getting my own container to run.
  
I used the instructions on dev.io given in the prject overview to create a container, but had troubble getting the continer to run. I got an error for being in the wrong directory, and have not been able to find the correct one, so I assume it is an issue with the way my files are arranged. I used the command docker run -p 4201:4200 angular-docker. I was able to run the hello-world container from dockerhub, so I know the issue is specific to the container I made. 

![image](https://github.com/user-attachments/assets/3f491475-c0ff-4875-86cd-b6708a32e01e)

## Public Acess Token How-To: 

I created a repository by logining in to DockerHub, clicking on 'Repositories' on the left under my username, and selecting the public option when prompted. 

I used DockerHub's instructions for making a Public Acess Key. (https://docs.docker.com/security/for-developers/access-tokens/)

How to Create a Token: 

  1) Avatar (in top right) > Account Settings > Personal Acess Tokens > Generate New Token
     
  3) Fill out the decription, experation date, etc when prompted.
     - At first, I gave myself read and write permisions, since I will likely be using this to add stuff to the repo and will want to pull from the repo.
       However, I ran into an error while trying to push an image to dockerhub later on, and ended up making a new token with all permisions. 
       
  4) COPY THE TOKEN AND SAVE IT! It will dissapear once the page is closed. 

How to Use a Token to Push an Image to DockerHub:

  1) In a terminal, do docker login -u USERNAME, and enter the token password when prompted.

  2) docker tag angular-docker:latest acrafton21/crafton-ceg3120:latest
  
  3) docker push acrafton21/crafton-ceg3120:latest

Links > 
https://medium.com/@komalminhas.96/a-step-by-step-guide-to-build-and-push-your-own-docker-images-to-dockerhub-709963d4a8bc 
Article that explains how to tag an image and push it to DockerHub. 
https://docs.docker.com/reference/cli/docker/image/push/
DockerHub how to push an image to DockerHub


# Link to the DockerHub Repository I Used for this Project > 
  https://hub.docker.com/repository/docker/acrafton21/crafton-ceg3120/general

## PART 2


Parts 2 and 3 are not completed. 

## Original Repository (has commit history) > 

https://github.com/Anna-Crafton/crafton-project4-ceg3121/tree/main 


## Stuff done after 4/25 

# Correct DockerHub Link (from feedback on Porject 4)
  https://hub.docker.com/r/acrafton21/crafton-ceg3120

To build the image, In a directory with my Dockerfile and angular-site, I did
 `docker build -t imageName .`

# How to push image to DockerHub 

1) Login from the terminal (using a token)
  `docker login` 
2) Tag the image
   `docker tag angular-docker acrafton21/crafton-ceg3120:latest`
3) Push
  `docker push acrafton21/crafton-ceg3120:latest`

# Action Secret How to: 

Created token same as before. 

Settings at middle top right, (not the ones under profile, the ones just for the repo)
'secrets and variabes' tab on the bottom left, then 'Actions' > new repository secret. 
Entre a name. 

Value for DOCKER_TOKEN is the Token password from earlier, and DOCKER_USERNAME is Dockerhub username.

# Github > Docker Workflow How-To:

Link to github page explainging workflows > https://docs.github.com/en/actions/writing-workflows/about-workflows 
https://dev.to/ken_mwaura1/automate-docker-image-builds-and-push-to-docker-hub-using-github-actions-32g5 

Make a .github/workflows folder with a .yml file in Github Repo.
I coppied one of the example workflows from the project 4 folder, and changed the repo to my repo and the branch name to main. 

I got an error saying "push access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed"
I fixed it by chaging the repo name variable to not include my username. 

# Workflow Explanation 

The workflow builds and pushes an image to Dockerhub whenever a new tag is pushed to github. 

'name:' is what shows up in the actions tab 

The next few lines tell the workflow to trigger when any new tag is pushed to github. 

```
on:
push:
tags: 
-'*' 
```

`env:' lists enviorment variables to be used later, which in my case is only my DockerHub repo name. 


'jobs:` indicates the start of a list of jobs for the workflow to do.


'build_and_push` is how the workflow identifies the job.


'name:' is how the job shows up in the actions tab.


`runs-on: ubuntu-latest` lists the type of runner used.


`steps:` lists a bunch of smaller pieces in the job. 


'Checkout repo to runner' is a step that calls an action to clone the repo to the runner.


'Set up Docker Buildx' is a step that calls an action to set up Buildex, which helps with Docker.


'Login to DockerHub' is a step that uses github secrets to login to DockerHub.


`with:` lets the action listed after `uses:` be sent the secret variables containing my username and token.
`username:` and 'password:` are perameter names.


'Build and Push' is a step that calls a docker action to build and push the image to DockerHub, and sends it the perameters `push:` and `tags:`.
` ${{ secrets.DOCKER_USERNAME }}/${{ env.DOCKER_HUB_REPO }}:${{github.ref_name}}` is a variable string that is assigned to the tag peremeter. It uses a docker secret contianing my username, '/', a enviormental vairable with my repo name, and the tag that has just been pushed to the github repo. 

# Link to Workflow 
https://github.com/WSU-kduncan/ceg3120-cicd-Anna-Crafton/blob/main/.github/workflows/build_and_push_to_docker.yml 


# Testing & Validating Workflow

To confirm the workflow did it's job, I did the following: 
1) Pushed a new tag to github to trigger the workflow.
2) Go to Github's Actions tab and check that the job has been triggered (It should turn green when done. Red means somthing isn't working.)
3) Open the Dockerhub repo in the browser and refresh the page to confirm the image has been pushed. 

![image](https://github.com/user-attachments/assets/095b4e43-d564-4cc7-ab69-7b92c13be704)













Test for github 










