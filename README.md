# DWMorgan Test Application

This README would normally document whatever steps are necessary to get the
application up and running.

* Dependencies:
	* Ruby version: `2.7.0`
	* Application Dependencies
		* Ruby on Rails: `6.0.4`
		* Bundler: `2.1.2`
	* System Dependencies
		* Postgres: `13.3`
		* Docker: `20.10.7`
		* Docker Compose: `1.29.2`

## Local Setup
### Setting up dependencies:
* Installing Ruby
I recommend installing it using a version manager like: [RVM](https://rvm.io/rvm/install)
After installing a ruby version manager, make sure to select and run ruby version `2.7.0`
* Installing application dependencies
Make sure you are running ruby version `2.7.0` and with it run the following:
	* `gem install 'rails:6.0.4' 'bundler:2.1.2'`
* Installing system dependencies
Make sure to install `postgresql` version `13.3` with your system's package manager.

### Setting up the application
* Initializing the application
	1. Run `bundle install` to install Gemfile dependencies.
	2. Run `rails db:create` to create and initialize the database for this application.
	3. To create the tables, run: `rails db:migrate`
	4. To parse the CSV data and save it into the database, run: `rails db:seed`
* Running the application
To run the application run `rails start` then go to 
`localhost:3000/top/confirmed?observation_date=yyyy-mm-dd&max_results=2`

## Running it in a container
If you have `Docker` installed in your system, you may also run the application in a container.
### Setting up the application
* Initializing the application
	* Run `docker-compose build app` to build this application's `Dockerfile`
	* Run `docker-compose run app bundle exec rails db:create` to create the database.
	* Run `docker-compose run app bundle exec rails db:migrate` to create the tables.
	* Run `docker-compose run app bundle exec rails db:seed` to parse the CSV data and save it into the database.
* Running the application
	* Run `docked-compose up -d` this will run the application on the background.
	* Go to `localhost:3000/top/confirmed?observation_date=yyyy-mm-dd&max_results=2` to check the application.
* Clean up
	* After doing operations on the application, you can run `docker-compose down` to turn of the daemonized application running in the background.
