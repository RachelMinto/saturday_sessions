
class DNA
  attr_reader :first_strand

  def initialize(first_strand)
    @first_strand = first_strand
  end

  def hamming_distance(second_strand)
    mutations = first_strand.each_char.with_index.select do |point, index|
      second_strand[index] && point != second_strand[index]
    end
    mutations.count
  end
end
