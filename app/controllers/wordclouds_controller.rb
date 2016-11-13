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
    @words = @wordcloud.reduced_word_count
    @user_photo = @wordcloud.user.profile_image_url
  end

  private

  def twitter_params
    params.require(:wordcloud).permit(:username)
  end
  
end
