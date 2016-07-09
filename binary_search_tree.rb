
class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(number)
    @data = number
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
    all_branches.unshift(@left.record_branch) if @left
    all_branches.push(@right.record_branch) if @right
    all_branches
  end

  def each
    all_data = record_branch.flatten
    return all_data.to_enum unless block_given?
    all_data.each { |data| yield(data) }
  end

  def >(other)
    data > other
  end
end
