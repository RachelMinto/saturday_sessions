
class Phrase
  attr_accessor :phrase

  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    words = phrase.scan(/\b\w+(?:'t)?\b/)
    words.each_with_object(Hash.new(0)) do |word, word_index|
      word_index[word] += 1
    end
  end
end
