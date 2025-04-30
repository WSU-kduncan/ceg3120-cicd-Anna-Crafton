## Project 5 

# Part 1 

# Semantic Versioning Explanation

https://travishorn.com/semantic-versioning-with-git-tags-1ef2d4aeede6 > Link to article explaining semantic versioning. (I was unable to access the one linked in the instructions)

Versions include 3 parts. 
Major - updates when the API changes 
Minor - updates for backwards compatable changes
Patch - backwards compatable bugs fixes 

Patch and Minor reset to zero when a number before them changes. 

# Tag How-To:

https://git-scm.com/book/en/v2/Git-Basics-Tagging > Link to Article explaining `git tag` commands. 

I taged a first git commit with `git tag -a v0.0.0 -m "first tag"`
and confirmed that it worked by doing `git tag -l' to see a list of tags. 

![image](https://github.com/user-attachments/assets/2f97f6b4-7514-4713-b4e7-b397817fa92a)

Then I pushed the tag using `git push origin v0.0.0`
and got a new tag message. 

![image](https://github.com/user-attachments/assets/57922780-9f4a-41e6-bdff-3d7db263995c)

# Workflow Tags How-To:


Link to workflow > https://github.com/WSU-kduncan/ceg3120-cicd-Anna-Crafton/blob/main/.github/workflows/build_and_push_to_docker.yml
https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows > link to article with workflow triggers 

I created a workflow variable called `TAG` and added a second docker image tag to the tags array at the end of the workflow file. 
So now it pushes both latest and whatever version is hardcoded into TAG to DockerHub. I confirmed this by triggering the workflow and then checking DockerHub. 

![image](https://github.com/user-attachments/assets/09a958a8-ba18-482f-ba80-08a7a500455f)

I changed the trigger from `push` to `published` to run when tags are updated. (this did not work)
I added `Tag: - '*'` under `push:` to have it trigger when any tag is added, and tested it by pushing several tags and some pushes wihtout tags. 


Link > https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs#github-context 

To get the docker version to update to the same version as my github repo, I used github.ref_name as the tag instead of my TAG variable. 

I had issues formatting the tag / removing the patch and minor versions from the string. I used %.*, but I belive the formatting was incorrect. 

So the workflow will update dockerhub with patches and with latest, but not with a major only or major minor version. 

## Part 2

# EC2 Setup: 

EC2 > Launch EC2 > Select Amazon Server > t2micro > Select a key > change the voume to 30 GB > click launch.

I did not change the security groups, since it already allowed SSH.

I downloaded the ssh public key from aws, chmod 700, and used it to ssh into my instance. 

How-To install docker on EC2 instance: 
`sudo apt update`
'sudo apt install docker.io` 

I confirmed docker was installed by doing `docker --version`

![image](https://github.com/user-attachments/assets/bce011b8-44ea-4115-9d2f-db994de74a65)

To confirm that everthing was working, I attempted to run docker's hello-world image. I was initally unable to pull it. Doing `docker -info` to check status gave me an error. 

![image](https://github.com/user-attachments/assets/61ce200b-b1ed-4efb-a965-7a83c0a91500)

This was fixed by adding myself to the docker group using `$ sudo usermod -aG docker ubuntu` as sugjested here (https://www.howtogeek.com/devops/how-to-troubleshoot-cannot-connect-to-the-docker-daemon-errors/#permissions-issues), and I was able to run the hello-world image. 

![image](https://github.com/user-attachments/assets/9de41173-e646-4d68-bcbf-154a5d4396cc)

Once I had confirmed everthing was working, I pulled my image. 

To set up the angular aplication, I did the following:

`sudo apt install npm' to install npm

'sudo npm install -g @angular/cli` to install angular (I am not sure if this worked, since it threw a bunch of error but everything seems to be working ok otherwise) 

`ng new angular-docker` to make a new angular aplication, and selected y at any prompts. 

I then created a new Dockerfile, copied the contents of the one from my github into it, and did `ng serve` from the same diectory as I added the Dockerfile to to run it. 

![image](https://github.com/user-attachments/assets/f031942f-6ee9-434a-a190-c677ccaf1fcb)






























