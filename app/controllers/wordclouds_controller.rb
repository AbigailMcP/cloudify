class WordcloudsController < ApplicationController
  def new
    @wordcloud = Wordcloud.new
  end

  def create
    wordcloud = Wordcloud.new(twitter_params)
    @results = wordcloud.tweets
  end

  def show
  end

  private

  def twitter_params
    params.require(:wordcloud).permit(:username)
  end
end
