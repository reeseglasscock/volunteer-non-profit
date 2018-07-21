# Non Profit Volunteer Tracker

This is a management system for a non profit that allows them to add and remove volunteers to projects that they create.

### Installing

Complete the steps below to clone the project on to your personal machine and get the application running.

Clone the repo from github to your machine

```
git clone https://github.com/reeseglasscock/volunteer-non-profit.git
```

Make sure that you have all gems needed on your machine.

```
bundle install
```

You will then need to create the databases locally on your system.

```
createdb [DATABASE NAME]
psql [DATABASE_NAME] < my_database.sql
createdb -T [DATABASE NAME] [TEST DATABASE NAME]
```

To run the application you will now need to have sinatra also installed on your system. You can then go to the project folder within terminal and run the command below to have the project start

```
ruby app.rb
```

Lastly point your web browser to localhost port 4567 to open the project.

```
open http://localhost:4567
```

## Deployment

Additionally you can deploy this code to your own app on Heroku.com for free. You can check out a live app by going to https://sensationnel-moliere-15695.herokuapp.com/. You can also find documentation for how to deploy your app on the Heroku website.

## Built With

* [Ruby](https://www.ruby-lang.org/en/news/2018/03/28/ruby-2-5-1-released/) - 2.5.1
* [Postgres](https://www.postgresql.org/) - 9.6.3
* [Sinatra](http://sinatrarb.com/) - 2.0.3

## User Stories

* As a non-profit employee, I want to view, add, update and delete projects.
* As a non-profit employee, I want to view and add volunteers.
* As a non-profit employee, I want to add volunteers to a project.

## Authors

* **Reese Glasscock** [Github](https://github.com/reeseglasscock)

## License

This project is licensed under the MIT License
