class WordcloudController < ApplicationController
  def new
    @wordcloud = Wordcloud.new
  end

  def create
    wordcloud = Wordcloud.new(twitter_params)
    @results = wordcloud.tweets
  end

  private

  def twitter_params
    params.permit(:username)
  end
end
