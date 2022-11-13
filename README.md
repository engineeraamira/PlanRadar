# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
3.1.0

* Rails version
7.0.4

* Database initialization
rails db:migrate

* How to run the test suite
bundle exec rspec

* start server
rails s

* in this application you can create users through sign up or create new user
* each user has sending reminder settings with default values and he can sign in and edit it
* anonymous users can create tickets and assign it to an employee with a due date 
* users enter the time which they want to receive the reminder in their time zone
* so there is a function to compare the specified ticket date with the users reminder settings
* if it is accepted then a job will send an email to the user in the specified time
* in case of the user was activated the reminder


