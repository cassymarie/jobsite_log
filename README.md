# Jobsite Log (Sinatra)

This sinatra app will setup a Jobsite that will track multiple jobs, tasks and their employees.  The Jobsite will have multiple jobs that will be worked on by many employees.  Each Job will have many areas and many tasks.  Each employee can work on many jobs, in many areas and do many tasks in each area.

## Installation

1. Clone the jobsite log: `git clone 'https://github.com/cassymarie/jobsite_log'`
2. Go into the cli directory `jobsite_log`
3. Run `bundle install`
4. Run `shotgun`
5. Open your browser and go to the local server: `http://localhost:9393/`

## Usage

In order to use the jobsite_log, users will need to login or signup.  Follow the prompt sign-in screen to get access to your jobsites.

Once a user is signed in, they will be taken to the jobsite dashboard which shows all the jobsite the user has setup.  By clicking on the specific jobsite name, the user will be taken to that jobsite dashboard page where they can add/edit specific jobs, employees, site tasks and more.  

For each category, there is an Add/Edit button to navigate to that categories add page.  The user can also select the delete/edit button next to the individual record to modify.  

Navigation buttons are located in the corners of each section to navigate between categories and jobsites. 

Additionally, there is the Time Entry form - that allows the user to enter in time worked by job/task/area for each individual.  *Currently, this will add the records to database, however no information is used after this.*

## Development

All work has been completed on the `origin-master` branch.  Multiple commits have been made throughout the development of the app.  

Future development ideas:  

- Total hours can be represented on the Dashboard page
- Daily time entry will generate reports by job
- Delete function will not remove records belonging in current jobsite time_entries, it will simply change to an inactive status until the jobsite is deleted.
- User login will have Admin status to view all jobsites created.
- Weekly data hours will generate time cards.

Most Wanted troubleshooting [video](https://youtu.be/-iylxiLdiPk)


## Contributing

Learn.co / Flatiron Phase 2 course topics have helped through most, if not all the issues.  

The following sites were a blessing to help with either the design or functionality for completion.

[ASCII generator](http://www.network-science.de/ascii/) \| [Rubular](https://rubular.com/) \| [Ruby-docs/classes](https://ruby-doc.org/core-2.7.2/index.html#classes) \| [HTML tag removal](https://snippets.aktagon.com/snippets/192-removing-html-tags-from-a-string-in-ruby)

Additionally, my husband helped with questions, best practices and some code reviews.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).