class Wordcloud < ApplicationRecord
  validates :username, presence: true

  def word_count
    count = Hash.new(0)
    all_words.each {|word| count[word] += 1}
    count
  end

  private

  def all_words
    tweets.map {|tweet| tweet.text.split(' ')}.flatten
  end

  def tweets
    options = {:count => 20, :include_rts => true}
    TWITTER.user_timeline(username, options)
  end

end
