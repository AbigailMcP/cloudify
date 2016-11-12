class Wordcloud

  def initialize(username = nil)
    @username = username
  end

  def tweets
    options = {:count => 10, :include_rts => true}
    search = TWITTER.user_timeline(@username, options)
  end

end
