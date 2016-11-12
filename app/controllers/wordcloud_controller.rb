class WordcloudController < ApplicationController
  def new
  end

  def create
    username = twitter_params[:username]
    options = {:count => 10, :include_rts => true}
    @search = TWITTER.user_timeline(username, options)
  end

  def show
  end

  private

  def twitter_params
    params.permit(:username)
  end
end
