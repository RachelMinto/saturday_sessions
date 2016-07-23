
class Triangle
  attr_reader :levels 
  attr_accessor :previous_row

  def initialize(levels)
    @levels = levels
    @previous_row = [1]
  end

  def rows
    levels.times
  end
end