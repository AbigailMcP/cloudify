class Wordcloud < ApplicationRecord
  validates :username, presence: true

  TWEET_COUNT = 30

  def word_count
    count = Hash.new(0)
    filtered_words.each {|word| count[word] += 1}
    count
  end

  private

  def filtered_words
    all_words - stop_words
  end

  def stop_words
    stopwords = File.readlines('./app/assets/stopwords.txt')
    stopwords_strip = stopwords.map(&:strip)
  end

  def all_words
    tweets.map {|tweet| tweet.text.downcase.gsub(/\W/, ' ').split(' ')}.flatten
  end

  def tweets
    options = {:count => TWEET_COUNT, :include_rts => true}
    TWITTER.user_timeline(username, options)
  end

end
