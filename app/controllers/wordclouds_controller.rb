require 'word_cloud'

class WordcloudsController < ApplicationController

  TWEET_COUNT = 100

  def new
    users = ['abigail_mcp', 'pixielabs', 'guardian']
    @examples = get_info(users)
  end

  def cloud
    options = {:count => TWEET_COUNT, :include_rts => true}
    tweets = TWITTER.user_timeline(params[:username], options)
    word_cloud = WordCloud.create(params[:username], tweets)
    redirect_to show_cloud_path
    rescue Twitter::Error::NotFound
      flash[:notice] = "Sorry, that username doesn't exist!"
      redirect_to root_path
  end

  def show_cloud
    word_cloud = WordCloud.instance
    @username = word_cloud.username
    @user_photo = TWITTER.user(@username).profile_image_url
    @word_count = word_cloud.reduced_word_count
  end

  def get_info(users)
    users.map do |username|
      [username, TWITTER.user(username).profile_image_url]
    end.to_h
  end

end
