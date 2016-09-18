class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end

  def to(limit)
    multiples = 0
    (@factors[0]...limit).to_a.each do |num|
      @factors.each do |factor|
        if num % factor == 0
          multiples += num
          break
        end
      end
    end

    multiples
  end
end
