module WordcloudHelper
  # This helper method is called from the 'show' view, taking in the reduced_word_count hash and an array of css classes (strings)
  # An index is calculated for each word, which is based on its count as a % of the most frequent word's count
  # This percentage is multiplied by 'classes.size - 1' s.t. the most frequent word is paired w/ last element in classes array
  # The yield statement passes each word and its newly associated 'class' to the block in the view
  def word_cloud(word_count, classes)
    max = highest_count(word_count)
    word_count.each do |word, count|
      weight = count.to_f/max * (classes.size - 1)
      yield(word, classes[weight.round])
    end
  end

  def highest_count(word_count)
    word_count.values.max
  end

end
