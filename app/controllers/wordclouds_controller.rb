require 'word_cloud'

class WordcloudsController < ApplicationController

  TWEET_COUNT = 100
  USERS = ['abigail_mcp', 'pixielabs', 'BBCNews']

  def new
    @examples = create_examples(USERS)
  end

  def post_cloud
    word_cloud = create_wordcloud(params[:username])
    @username = word_cloud.username
    @user_photo = TWITTER.user(@username).profile_image_url
    @word_count = word_cloud.reduced_word_count
    rescue Twitter::Error::NotFound
      flash[:notice] = "Sorry, that username doesn't exist!"
      redirect_to root_path
  end

  def get_cloud
    redirect_to root_path
  end

  private

  def create_wordcloud(username)
    options = {:count => TWEET_COUNT, :include_rts => true}
    tweets = TWITTER.user_timeline(username, options)
    WordCloud.new(username, tweets)
  end

  def create_examples(users)
    users.map do |username|
      [username, TWITTER.user(username).profile_image_url]
    end.to_h
  end

end
