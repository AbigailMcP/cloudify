# I decided to put this code in a helper (and not in the model) as it is concerned with presentation only

module WordcloudHelper

  # This helper method is called from the 'show' view
  # The method takes in the reduced_word_count hash and an array of css classes (strings)
  # An index is calculated for each word, which is based on its count as a % of the most frequent word's count
  # This percentage is multiplied by 'classes.size - 1' s.t. the most frequent word is paired w/ last element in classes array
  # The yield statement passes each word and its newly associated 'class' to the block in the view
  def word_cloud(words, classes)
    max = highest_count(words)
    words.each do |word, count|
      index = count.to_f/max * (classes.size - 1)
      yield(word, classes[index.round])
    end
  end

  def highest_count(hash)
    hash.values.max
  end

end
