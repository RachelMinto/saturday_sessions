
class Matrix
  attr_accessor :data
  
  def initialize(data)
    @data = data
  end
  
  def rows
    split_data = data.split(/\n/).map { |row| row.split(' ') }
    integer_data = split_data.map { |num| num.map { |n| n.to_i } }
    integer_data
    
    # string.split("\n").map(&:split).map { |row| row.map(&:to_i) }
  end
  
  def columns
  end
  
  def saddle_points
  end
end


matrix = Matrix.new("1 2\n10 20")
p matrix.rows