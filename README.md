# README

This application is not under active development.
Feel free to clone or fork.

## Description

With this application you can compete with friends for anything you want (weight, points, counts, ...).
Everyone taking part in the competition can set their own goal(s) for a given time.

For example if you compete for 90 days, you could set your goals to:

* losing 5kg of weight
* going for a run for at least 25 times
* 10.000 freeletics points

![Alt text](/screenshots/dashboard.png?raw=true "Dashboard")

## Installation

Requirements:
* ruby (I used 2.2.4)
* sqlite3

Classical rails setup:

1. clone the repo
2. cd into directory
3. bundle install
4. bundle exec rake db:migrate
5. bundle exec rake db:seed (check seed file first)
6. Optional: Set timezone and locale in application.rb (current languages: de and en)
7. Optional?: As I made that app for a competition with close friends, I seeded users too, so there is no user administration yet
8. bundle exec rails server

## The application

### The dashboard

The dashboard shows your current stats.
Your total progress (%) and your progress for each of your goals.

Beneath that you can see the current standings.

Last but not least you can see all users last (public) activities.

### Goals

Every user can set as many goals as he/she wants.
You can give it a name, a type (the ones from the seed file) and a value you want to reach.

### Milestones

The users milestones are the values that are taken for stats/progress calculation.

### My activities

Entries that are made here are just kind of a activity logfile.
Users can enter activities that are not relevant for stats, but wich they want to track.
For example "Bike ride, 20km".
Users can choose if activities are public or not, so if other competitors can see that activity.



Thats it, have fun!!!
