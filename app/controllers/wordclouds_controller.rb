class WordcloudsController < ApplicationController

  TWEET_COUNT = 100
  WORD_COUNT = 50

  def new
  end

  def cloud
    options = {:count => TWEET_COUNT, :include_rts => true}
    tweets = TWITTER.user_timeline(params['username'], options)
    $wordcloud = WordCloud.new(params['username'], tweets)
    redirect_to show_cloud_path
  end

  def show_cloud
    @username = $wordcloud.username
    @user_photo = $wordcloud.user.profile_image_url
    @words = $wordcloud.reduced_word_count
  end

end
