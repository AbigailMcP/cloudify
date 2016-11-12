class WordcloudsController < ApplicationController
  def new
    @wordcloud = Wordcloud.new
  end

  def create
    wordcloud = Wordcloud.new(twitter_params)
    @results = wordcloud.tweets
    @array = wordcloud.all_words
    @word_count = wordcloud.word_count
  end

  def show
  end

  private

  def twitter_params
    params.require(:wordcloud).permit(:username)
  end
end
