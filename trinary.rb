class Trinary
  attr_accessor :trinary_number

  def initialize(number)
    @trinary_number = number
  end

  def to_decimal
    return 0 if @trinary_number.match(/[^0-3]/)
    exponent = -1

    decimal_num = @trinary_number.split('').reverse.map do |digit|
      exponent += 1
      digit.to_i * 3 ** exponent
    end

    decimal_num.reverse.reduce(:+)
  end
end