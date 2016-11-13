# Cloudify

Cloudify is a web based application that creates word clouds from Twitter timelines. Just enter a user's Twitter handle and watch as a hella-fly Tweet cloud materialises.

Visit the [deployed version](https://cloudify.herokuapp.com/) and cloudify to your heart's content.

(Please scroll down for instructions on running the app locally and notes on my approach to the project.)

![Imgur](http://i.imgur.com/hBBQBEA.png)

![Imgur](http://i.imgur.com/a7q1Y6J.png)


## Development setup

### Installation prerequisites

First, you will need to install [Homebrew](http://brew.sh/).

Once installed, you can run the following via the Homebrew package manager in the command line.

Ruby

	$ brew install ruby

PostgreSQL

	$ brew install postgres

Bundler

	$ gem install bundler

### Running the app

Clone the repository on GitHub:

	$ git clone https://github.com/AbigailMcP/cloudify.git

Enter your new project folder:

	$ cd cloudify

Create a .env file and update with your own Twitter keys. You will need to [set up a Twitter app](https://apps.twitter.com/) to get your own credentials.

```
CONSUMER_KEY=your_consumer_key
CONSUMER_SECRET=your_consumer_secret
ACCESS_TOKEN=your_access_token
ACCESS_TOKEN_SECRET=your_access_token_secret
```

Install all the dependencies from the Gemfile using Bundler:

	$ bundle install

Create the necessary Cloudify databases and run the migrations:

	$ rails db:create db:migrate

Run the Rails server:

	$ rails s

### Running tests

Run tests using RSpec:

	$ rspec

## Notes on approach

Coming soon!

#### To do

- Button on cloud page linking back to homepage - done
- Error handling for invalid username
- Option to change colour of word cloud
- Snazzy Favicon!
