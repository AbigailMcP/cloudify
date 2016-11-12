class Wordcloud < ApplicationRecord
  validates :username, presence: true

  def tweets
    options = {:count => 10, :include_rts => true}
    TWITTER.user_timeline(username, options)
  end

end
