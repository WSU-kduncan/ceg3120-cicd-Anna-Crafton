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

I changed the trigger from `push` to `published` to run when tags are updated. 









