class Wordcloud < ApplicationRecord
  validates :username, presence: true

  TWEET_COUNT = 1000

  def reduced_word_count
    ordered_word_count.first(50).shuffle.to_h
  end

  private

  def ordered_word_count
    word_count.sort_by {|k,v| v}.reverse.to_h
  end

  def word_count
    count = Hash.new(0)
    filtered_words.each {|word| count[word] += 1}
    count
  end

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
