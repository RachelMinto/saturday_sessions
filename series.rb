
class Series
  attr_reader :numbers
  def initialize(numbers)
    @numbers = numbers
  end
  
  def slices(length_of_slice)
    raise ArgumentError, "Slice cannot be longer than string" if length_of_slice > @numbers.length
    @numbers.split('').collect { |n| n.to_i }.each_cons(length_of_slice).to_a
  end
end