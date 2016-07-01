
class PerfectNumber
  def self.classify(number)
    argument_check(number)

    divisors_total = divisors(number).inject(:+)
    if divisors_total == number
      'perfect'
    elsif divisors_total < number
      'deficient'
    else
      'abundant'
    end
  end

  def self.argument_check(number)
    unless number.to_i > 1 && number.to_i == number
      raise RuntimeError, 'Must be a positive integer'
    end
  end

  def self.divisors(number)
    (1..number - 1).select { |num| number % num == 0 }
  end
end
