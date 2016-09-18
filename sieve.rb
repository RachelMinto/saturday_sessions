class Sieve
  attr_accessor :numbers_to_check, :primes

  def initialize(limit)
    @numbers_to_check = (2..limit).to_a
    @primes = (2..limit).to_a
  end

  def reject_nonprime(prime)
    @primes.reject! { |num| num != prime && num % prime == 0 }
  end

  def primes
    @numbers_to_check.each {|prime| reject_nonprime(prime)}
    @primes
  end
end

