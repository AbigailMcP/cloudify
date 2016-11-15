# Cloudify

Cloudify is a web based application that creates word clouds from Twitter timelines. Just enter a user's Twitter handle and watch as a hella-fly Tweet cloud materialises.

Visit the [deployed version](https://cloudify.herokuapp.com/) and cloudify to your heart's content.

(Please scroll down for instructions on running the app locally and notes on my approach to the project.)

![Imgur](http://i.imgur.com/Dbl7TLq.png)

![Imgur](http://i.imgur.com/bJT6lnk.png)


## Development setup

### Running the app

Clone the repository from GitHub:

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

Run the Rails server:

	$ rails s

### Running tests

Run tests using RSpec:

	$ rspec

## Notes on approach

### Back-end
I used Rails to build this app in order to get it set up quickly and easily. To begin with, I had a WordCloud model, and used the Rails provided 'resources' to arrange my routes. However, I soon came to realise that my database was redundant - I didn't need to store any of the information from the Twitter API, it only needed to persist between the POST route (`/cloud`) and the GET route (`/show_cloud`).

Taking this into account, I decided to migrate my model across to a `/lib` class. This contains all the logic needed to provide my front end with a hash of words and their corresponding frequencies.

This gave me a couple of issues when deploying to Heroku - namely that my file in `/lib` was not being loaded. I got around this by requiring the file in `wordclouds_controller.rb`, however wonder whether there is a better way to achieve the same outcome.

### Front-end

I created `wordcloud_helper.rb` to store the logic relating to the css classes. This helper method effectively chooses the right css class for each word depending on their 'weight', ie their frequency compared to the most frequent.

As this is presentational logic only, I decided it was not the responsibility of the `WordCloud` class.

#### To do

- Button on cloud page linking back to homepage - done
- Error handling for invalid username - done
- Snazzy Favicon! - done
- Option to change colour of word cloud - OUTSTANDING
