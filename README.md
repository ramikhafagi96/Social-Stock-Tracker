# Social Stock Tracker

This is a social web application in which users can track stocks and follow other users and see what stocks they are tracking.

## Table Of Contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Examples](#examples)
* [Contact](#contact)

## General Info

I developed this web application to learn the following:
* Using <strong>devise</strong> gem for user authentication and authorization
* Use self-referential association to implement following users relationship
* Using <strong>ActiveJobs</strong> and <strong>Sidekiq</strong> to schedule jobs using <strong>cron</strong> and adding them to a queue
* Implement a search bar to search for stocks and users
* Using AJAX to update the web app asynchronously

## Technologies
* Ruby v2.7.1
* Rails v6.0.3
* SQLite v1.4.0
* Sidekiq v6.1.2
* Redis v6.0.8
* Bootstrap4 v4.5.2

# Setup
To clone and run this application, you'll need [Ruby](https://www.ruby-lang.org/en/), [Rails](https://rubyonrails.org) and [Redis](https://redis.io) on your machine. Also, an [IEX client](http://IEXcloud.io) API key. <br/>
From your terminal:

```bash
# Clone this repository
$ git clone https://github.com/ramikhafagi96/Social-Stock-Tracker.git

# Go into the repository directory
$ cd social-stock-tracker

# Install gems needed
$ bundle install

# Run the app
$ rails server

# Run Redis
redis-server

# Run Sidekiq
bundle exec sidekiq
```

## Features
- Authenticate and authorize users using devise gem
- Devise gem views for login and signup
- A user can search for a stock using it's ticker symbol
- A user can add a stock to his portfolio so he can track it
- A user can search for another user using name or email
- A user can follow other users to view the stocks tracked by them
- A job is scheduled using <strong>cron</strong> and </strong>sidekiq</strong> every minute to update the stock prices in the database by fetching new prices from [IEX cloud](https://iexcloud.io).

## Examples
### Search And Track A Stock
![image](https://github.com/ramikhafagi96/Social-Stock-Tracker/blob/main/images/track-stock.gif)
### Search And Follow A User
![image](https://github.com/ramikhafagi96/Social-Stock-Tracker/blob/main/images/follow-user.gif)

## Contact
Email: rami.developer96@gmail.com <br/>
Linkedin: <a href="https://linkedin.com/in/ramikhafagi96">ramikhafagi96</a>
