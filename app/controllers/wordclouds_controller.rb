class WordcloudsController < ApplicationController
  def new
    @wordcloud = Wordcloud.new
  end

  def create
    @wordcloud = Wordcloud.new(twitter_params)
    if @wordcloud.save
      redirect_to wordcloud_path(@wordcloud)
    else
      render :new
    end
  end

  def show
    @wordcloud = Wordcloud.find(params[:id])
    @word_count = @wordcloud.word_count
  end

  private

  def twitter_params
    params.require(:wordcloud).permit(:username)
  end
end
