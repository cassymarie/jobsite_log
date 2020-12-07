# Jobsite Time Entry (Sinatra Assessment)
Sinatra app that will setup a Jobsite that will track multiple jobs and the hours worked by each employee.  The Jobsite will have multiple jobs that will be worked on by many employees.  Each Job will have many areas and many tasks.  Each employee can work on many jobs, in many areas and do many tasks in each area. 

## User Story

***As a User...***
I should be able to access my jobsites only once I login.
I want to have a list to track the employees on my Jobsite and which Job/Area/Task they work on each day A User should be able to...

***A user should be able to...***
Add/Remove both Jobs and Employees to my jobsite.
Specify the Job/Area/Task that my employee worked on and for how long.
Generate the total hours worked for both: Individual employee and Each Job

## Project Design
*MVP:*
- [ ] User Signup
- [ ] User Login - has access to only individual jobsite
- [ ] Can create a new Jobsite
- [ ] Can create a Job that belongs to the Jobsite
- [ ] Can setup areas for specific job
- [ ] Can setup tasks for the jobsite (to be used on all areas)
- [ ] User can add employees to the jobsite 
- [ ] User can remove employees from jobsite - only if 0 hours worked that week
- [ ] User can list and employee on a specific job/area, doing a specific task - for a certain length of time (hours)
- [ ] User can view the list of total hours worked by individual/job

*Stretch Goals*
- [ ] Can create a daily report by employee title
- [ ] Create custom validations


## Specifications for Assessment
Specs:
- [x] Use Sinatra to build the app
- [ ] Use ActiveRecord for storing information in a database
- [ ] Include more than one model class (e.g. User, Post, Category)
- [ ] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- [ ] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- [ ] Include user accounts with unique login attribute (username or email)
- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
