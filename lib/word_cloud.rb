class WordCloud

  TWEET_COUNT = 100
  WORD_COUNT = 50

  attr_reader :username

  def initialize(username, tweets)
    @username = username
    @tweets = tweets
  end

  # Method to select most frequent words
  # Returns shuffled hash (so that all 'large' words are not displayed together in word cloud)
  def reduced_word_count
    ordered_word_count.first(WORD_COUNT).shuffle.to_h
  end

  # Method to return Twitter user object - used to display profile image
  # Not sure that this belongs here in the model... looks out of place
  def user
    TWITTER.user(username)
  end

  def self.create(username, tweets)
    @wordcloud = WordCloud.new(username, tweets)
  end

  def self.instance
    @wordcloud
  end

  private

  # Method to order words by frequency (so that words with low frequencies can be ignored)
  # Returns ordered hash
  def ordered_word_count
    word_count.sort_by {|k,v| v}.reverse.to_h
  end

  # Method to create hash of words & their frequencies
  def word_count
    count = Hash.new(0)
    filtered_words.each {|word| count[word] += 1}
    count
  end

  # Method to remove stopwords, returning array of filtered words
  def filtered_words
    all_words - stop_words
  end

  # Method to read stopwords from the .txt file, stripping out trailing newlines
  # Returns array of stopwords
  def stop_words
    stopwords = File.readlines('./app/assets/stopwords.txt')
    stopwords_strip = stopwords.map(&:strip)
  end

  # Methods to map Tweets the their 'text' and split/flatten into an array of individual words
  # Before splitting Tweets into words, all text is downcased and punctuation is removed to prevent duplication
  def all_words
    tweet_text.map {|tweet| tweet.downcase.gsub(/\W/, ' ').split(' ')}.flatten
  end

  def tweet_text
    tweets.map {|tweet| tweet.text}
  end

  attr_reader :tweets

end
