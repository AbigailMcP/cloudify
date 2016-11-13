class Wordcloud < ApplicationRecord
  validates :username, presence: true

  # STOPWORDS = File.readlines('./app/assets/stopwords.txt')
  # STOPWORDS2 = STOPWORDS.map(&:strip)

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
    tweets.map {|tweet| tweet.text.downcase.split(' ')}.flatten
  end

  def tweets
    options = {:count => 20, :include_rts => true}
    TWITTER.user_timeline(username, options)
  end

end
