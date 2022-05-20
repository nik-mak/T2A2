# T2A2 - Marketplace Project - Nerd Bucket

## R7 - Identification of the problem you are trying to solve by building this particular marketplace app.
The problem this site aims to solve is making it easier for the general public and new/junior devs to connect with established developers and to work together on a project. 

## R8 - Why is it a problem that needs solving?
People can often find it tiresome or intimidating to find established developers and end up deciding to forego contacting anyone. This barrier to discovering developers has prevented many people from discovering talent and what the world of programming looks like. By having a site like this, it allows for the general public to peirce the bubble that encapsulates the world of software developers. It allows the general public to peer into this world and see what goes on under the hood many of the sites/applications that they use on a daily basis. 

This barrier has also prevented new and upcoming developers from learning about the processes involved in creating such programs. While traditional education can teach someone how to write a method or function, it is often the case that most new developers don't get exposed to the developmental process involved until they get a job in the field.

## R9 - A link (URL) to your deployed app (i.e. website)
https://intense-ravine-98420.herokuapp.com/

## R10 - A link to your GitHub repository (repo).
https://github.com/nik-mak/t2a2

## R11 - Description of your marketplace app (website), including:
- Purpose
This web app is designed to connect people with developers, to work together on a project from start to end or somewhere in between.

- Functionality / features
  - Users can create their own profile which contains a their name, bio, their skills, if they're a developer, and the projects they have posted/worked on.
  - Users can create a project, which only they can edit/delete the details for it.
  - Projects created must have a name and description.
  - A user can add their skills from a list or add a new one if not present.
  - Users can discover developers and projects from the nav bar, as well as finding developers based on a skill.
  - A user can join/leave a project by navigating to that projects page.
  - Projects can be marked as completed by the requester which will block any attempt to join/leave the project.

- Sitemap

![Sitemap](../docs/sitemap.png)

- Screenshots


- Target audience
  - Developers of all skill levels
  - People who are interested in having a project done
- Tech stack (e.g. html, css, deployment platform, etc)
  - Ruby on Rails
  - HTML
  - CSS(Bootstrap)
  - Heroku
  - Cloudinary

## R12 - User stories for your app
User stories for the application can be found on the Trello Board:

https://trello.com/b/Bzz6qfvz/t2a2-marketplace-project

## R13 - Wireframes for your app
![Homepage](../docs/Homepage.png)

![User Page](../docs/Users%20Page.png)

![Developers](../docs/Developers%20Page.png)

![Projects Page](../docs/Projects%20Page.png)

![Project Page](../docs/Project%20Page.png)
## R14 - An ERD for your app
![ERD](../docs/erd.jpg)

## R15 - Explain the different high-level components (abstractions) in your app
Tables
- Projects
  This table contains the main information for a project; name, description, status, and user(who posted it).
- Skills
  This table contains a list of skills
- Users
  This contains the information for a user; first name, last name, description/bio, email, password, and if they're a developer.

These three tables are joined together using the User Projects and User Skills tables.

The User Project table contains the project ID and user ID(developers working on the project). This table allows for having multiple people collaborate on a given project without compromising the integrity of the Projects table. The user specified in the Projects table is the user that created the table and the users specified in the User Projects table are the users that are working on it.

The User Skills table contains the skill ID and user ID. By having this table multiple people are able to have the same skill without having to create a new record of a skill.

All the profile images on the site are handled through the Active record tables using the cloudinary API. This allows each user to upload a profile img which is stored in the cloudinary cloud and a link is created which then associates that img with the user.

## R16 - Detail any third party services that your app will use
- Cloudinary
  
  This service allows for images to be uploaded to a cloud rather than local storage. This allows for images to be visible and accessible to any computer that has access to the site (user must also have the right permissions). 
- Heroku

  The app is deployed using Heroku. This was chosen over other deployment services due to it is much easier to implement.

## R17 - Describe your projects models in terms of the relationships (active record associations) they have with each other
- Skill model has many User Skills and has many users through the User Skill model. This allows for a skill to be associated with many users without having to create a new record for each user/skill combination.
- User Skills model belongs to the models User and Skill. This model joins the two tables together.
- The Project model belongs to a User. This is to associate a project with a User. It also has many User Projects and has many Users through User Projects. This creates the association between the developers and the given project.
- User Project model belongs to the Project and User models. This table connects the project with the users that are developing the project.
- User model is the main focus of a lot of the associations with the app. A user has many User Skills and has many Skills through the User skill model. It can have one attached image. It also has many User Projects, has many developer projects through User Projects, and has many requester projects through User Projects. These models work together together in order to correctly establish the relationship between a User, they're Skills, and the Projects they have either requested or developing.


## R18 - Discuss the database relations to be implemented in your application
|Models|Relationship|Explanation|
|---|---|---|
|UserSkills -> Skills|One and only one|This is to make sure that each record in the UserSkills table has only one associated Skill.|
|Skills -> UserSkills|Zero to many|A Skill can not exist in the UserSkill model (i.e. no User has this skill) but it can also appear many times (i.e. multiple Users have the same skill)|
|UserSkills -> User|One and only one|Each record of UserSkills can only have one User attached|
|User -> UserSkills|One and only one|Each record of User can only have one record of a given skill (i.e. a User can only be associated with 'Skill_One' once and not multiple times)|
|ActiveStorage -> User|One and only one (required)|For each record of an image in Active Storage, there must also be a user associated with it.|
|User -> ActiveStorage|One and only one (optional)|A User can have only one image attached to their profile if they so choose.|
|User -> Projects|Zero to many|A User is not required to have any project associated with them.|
|Projects -> User|One and only one|A project can only have one (requester) User.|
|UserProjects -> Projects|One and only one|A UserProject record can only be associated with only one Project|
|Projects -> UserProjects|Zero to many|A Project does not require any UserProjects to exist (i.e. for a Project to exist there doesn't have to have a developer attached).|
|User -> UserProjects|One and only one|Each record of User can only have one record for a given project (i.e. a User can only be associated with 'Project One' once).|
|UserProjects -> User|One and only one|For each record in UserProjects, there can only be one User|
## R19 - Provide your database schema design
See R14

## R20 - Describe the way tasks are allocated and tracked in your project
Task for this project are tracked using Trello.

https://trello.com/b/Bzz6qfvz/t2a2-marketplace-project

## References
Profile images we gathered from [Pexel](https://www.pexels.com/search/profile%20picture/)