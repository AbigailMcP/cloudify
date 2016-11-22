describe WordCloud do

  tweet1 = "I am a tweet!"
  tweet2 = "Big Bears and Cats"
  tweet3 = "big CATS"
  tweet4 = "tweet cats"
  tweet5 = "tweet cats"
  tweet6 = "https://example"

  # Frequency check for test data:
  # 'cats' = 4
  # 'tweet' = 3
  # 'big' = 2
  # 'bears' = 1

  subject(:wordcloud) { described_class.new('abigail_mcp', tweet_list) }
  let(:tweet_list) { [tweet1, tweet2, tweet3, tweet4, tweet5] }

  before(:each) do
    # this means that tests do not make calls to the Twitter API
    allow(wordcloud).to receive(:tweet_text) { tweet_list }
  end

  describe '#reduced_word_count' do
    it 'returns an hash of 4 pairs' do
      expect(wordcloud.reduced_word_count.count).to eq 4
    end

    it 'has smallest value of 1 (bears)' do
      min = wordcloud.reduced_word_count.values.min
      expect(min).to eq 1
    end

    it 'has largest value of 5 (cats)' do
      max = wordcloud.reduced_word_count.values.max
      expect(max).to eq 4
    end

    it 'does not include any punctuation' do
      hash = wordcloud.reduced_word_count
      hash2 = hash.reject {|k,v| k[/[\w]*/] != k}
      expect(hash).to eq(hash2)
    end

    it 'does not include any stopwords' do
      stopwords = File.readlines('./app/assets/stopwords.txt')
      stopwords_strip = stopwords.map(&:strip)
      hash = wordcloud.reduced_word_count
      hash2 = hash.reject {|k,v| stopwords_strip.include? k }
      expect(hash).to eq(hash2)
    end

    it 'contains only downcase words' do
      hash = wordcloud.reduced_word_count
      expect(hash.key?('Cats')).to eq false
    end

    it 'does not include any links' do
      hash = wordcloud.reduced_word_count
      expect(hash.key?('https://example')).to eq false
    end
  end

end
