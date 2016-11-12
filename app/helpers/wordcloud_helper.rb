module WordcloudHelper

  def word_cloud(word_count, classes)
    max = highest_count(word_count)
    word_count.each do |word, count|
      index = count.to_f/max * (classes.size - 1)
      yield(word, classes[index.round])
    end
  end

  def highest_count(hash)
    hash.values.max
  end

end
