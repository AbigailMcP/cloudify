require 'word_cloud'

class WordcloudsController < ApplicationController

  TWEET_COUNT = 100
  USERS = ['abigail_mcp', 'pixielabs', 'BBCNews']

  def new
    @examples = get_info(USERS)
  end

  def post_cloud
    options = {:count => TWEET_COUNT, :include_rts => true}
    tweets = TWITTER.user_timeline(params[:username], options)
    word_cloud = WordCloud.new(params[:username], tweets)
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

  def get_info(users)
    users.map do |username|
      [username, TWITTER.user(username).profile_image_url]
    end.to_h
  end

end
