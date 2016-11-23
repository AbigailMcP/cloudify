class WordCloud

  WORD_COUNT = 50

  attr_reader :username

  def initialize(username, tweets)
    @username = username
    @tweets = tweets
  end

  def reduced_word_count
    ordered_word_count.first(WORD_COUNT).shuffle.to_h
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

  def clean_words
    tweet_words.map {|tweet| tweet.gsub(/\b(http\w*)\b/,' ').gsub(/\W/, ' ').split(' ')}.flatten
  end

  def filtered_words
    clean_words - stop_words
  end

  def stop_words
    stopwords = File.readlines('./app/assets/stopwords.txt')
    stopwords_strip = stopwords.map(&:strip)
  end

  def tweet_words
    tweet_text.map {|tweet| tweet.downcase.split(' ')}.flatten
  end

  def tweet_text
    tweets.map {|tweet| tweet.text}
  end

  attr_reader :tweets

end
