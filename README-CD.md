## Project 5 

## Part 1 

# Semantic Versioning Explanation

https://travishorn.com/semantic-versioning-with-git-tags-1ef2d4aeede6 > Link to article explaining semantic versioning. (I was unable to access the one linked in the instructions)

Versions include 3 parts. 
Major - updates when the API changes 
Minor - updates for backwards compatable changes
Patch - backwards compatable bugs fixes 

Patch and Minor reset to zero when a number before them changes. 

# Taging How-To:

https://git-scm.com/book/en/v2/Git-Basics-Tagging > Link to Article explaining `git tag` commands. 

I taged a first git commit with `git tag -a v0.0.0 -m "first tag"`
and confirmed that it worked by doing `git tag -l' to see a list of tags. 

![image](https://github.com/user-attachments/assets/2f97f6b4-7514-4713-b4e7-b397817fa92a)

Then I pushed the tag using `git push origin v0.0.0`
and got a new tag message. 

![image](https://github.com/user-attachments/assets/57922780-9f4a-41e6-bdff-3d7db263995c)

`git tag` will list all the tags in a repo. 

# Workflow Tags How-To:

Sources: 
  
  Link to article with a list of workflow triggers > https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows
  
  
  Link to article on how to acess github info from a workflow >  https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs#github-context 


Summery: 

  I was able to get the workflow to tag and push the docker image with the same tag I pushed to github by retriving the github tag with ` github.ref_name`, and then pushing it to docker. I also pushed the latest version. The workflow will update dockerhub with major.minor.patch versions and with latest, but not with a major only or major.minor version as requested in the instructions. 


Stuff I tried: 

  I created a workflow variable called `TAG` and added a second docker image tag to the tags array at the end of the workflow file. 
  So now it pushes both latest and whatever version is hardcoded into TAG to DockerHub. I confirmed this by triggering the workflow and then checking DockerHub. 
  
  ![image](https://github.com/user-attachments/assets/09a958a8-ba18-482f-ba80-08a7a500455f)
  
  I changed the trigger from `push` to `published` to run when tags are updated. (this did not work)

  
  I added `Tag: - '*'` under `push:` to have it trigger when any tag is added, and tested it by pushing several tags and some pushes wihtout tags. 
  
  
  To get the docker version to update to the same version as my github repo, I used github.ref_name as the tag instead of my TAG variable. 
  
  I had issues formatting the tag / removing the patch and minor versions from the string. I used `%.*` to try and remove all the charaters after the last `.` in the version string, but I belive the formatting was incorrect. 


# Workflow 

Notes on Workflow: 

  The vast majority of the workflow file is from the example workflow file. 

  # Notes / Explanation of Workflow are not done!
  
  Link to workflow > https://github.com/WSU-kduncan/ceg3120-cicd-Anna-Crafton/blob/main/.github/workflows/build_and_push_to_docker.yml

## Part 2

# EC2 Setup: 

How to Create EC2: 

  1) Open AWS
  2) CLick on EC2 (in orange)
  3) Click Launch EC2 
  4) Seclect Amazon Server 
  5) Scroll down, and select t2micro (this is the default)
  6) Select a key pair
  7) Scroll down, and change the colume to 30 GB 
  8) Click Launch


Notes on EC2: 

  I did not change the security groups, since they already allowed SSH. 

  
  I lost my original key file, but was able to download a new ssh public key from aws. To use it, I did `chmod 700` to change the permisions, 
  then `ssh -i lab5Key.pem ubuntu@35.172.190.12` to acess the instance. 

How-To install Docker on EC2 Instance: 
  
  1) Do `sudo apt update` to update everything to the point where stuff actually works. (this took several minutes, but could have been terrible wifi) 
  2) 'sudo apt install docker.io` to install docker.
  3) Make sure docker is actually installed by doing `docker --version`. (this should display a version number if it worked) 

     ![image](https://github.com/user-attachments/assets/bce011b8-44ea-4115-9d2f-db994de74a65)

How-To Run an Image: 
To confirm that everthing was working, I attempted to run docker's hello-world image. (same as in project 4) I was initally unable to pull it. Doing `docker -info` to check status gave me an error. 

![image](https://github.com/user-attachments/assets/61ce200b-b1ed-4efb-a965-7a83c0a91500)

This was fixed by adding myself to the docker group using `$ sudo usermod -aG docker ubuntu` as sugjested here (https://www.howtogeek.com/devops/how-to-troubleshoot-cannot-connect-to-the-docker-daemon-errors/#permissions-issues), after which I was able to run the hello-world image.

![image](https://github.com/user-attachments/assets/9de41173-e646-4d68-bcbf-154a5d4396cc)

Once I had confirmed everthing was working, I pulled the latest image from my DockerHub with `docker pull acrafton21/crafton-ceg3120:latest`. 


To set up an angular aplication, I did the following:


  `sudo apt install npm' to install npm
  
  
  'sudo npm install -g @angular/cli` to install angular (I am not sure if this worked, since it threw a bunch of error but everything seems to be working ok otherwise) 
  
  
  `ng new angular-docker` to make a new angular aplication, and selected y at any prompts. 
  
  
  I then created a new Dockerfile, copied the contents of the one from my github into it, and did `ng serve` from the same diectory as I added the Dockerfile to to run it. 

  
  ![image](https://github.com/user-attachments/assets/f031942f-6ee9-434a-a190-c677ccaf1fcb)


## Part 2 points 3 - end are not completed! 



























