
class PerfectNumber
  def self.classify(number)
    self.argument_check(number)

    divisors_total = self.divisors(number).inject(:+)
    if divisors_total == number
      'perfect'
    elsif divisors_total < number
      'deficient'
    else
      'abundant'
    end
  end

protected
  def self.argument_check(number)
    unless number.to_i > 1 && number.to_i == number
      raise RuntimeError, 'Argument must be a positive integer'
    end
  end

  def self.divisors(number)
    (1..number-1).select {|num| number % num == 0}
  end
end
