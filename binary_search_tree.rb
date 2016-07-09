
class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(number)
    @data= number
    @left = nil
    @right = nil
  end

  def insert(next_num)
    if data >= next_num 
      !left ? @left = Bst.new(next_num) : @left.insert(next_num)
    else
      !right ? @right = Bst.new(next_num) : @right.insert(next_num)
    end
  end

  def record_branch
    all_branches = [@data]
    if @left
      all_branches.unshift(@left.record_branch)
    end
    if @right
      all_branches.push(@right.record_branch)
    end
    all_branches
  end

  def each
    all_data = record_branch.flatten
    return all_data.to_enum if !block_given?
    all_data.each { |data| yield(data)}
  end

  def > (other)
    self.data > other
  end
end
