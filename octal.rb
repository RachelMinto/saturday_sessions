class Octal
  attr_accessor :octal_number

  def initialize(octal_number)
    @octal_number = octal_number
  end

  def to_decimal
    return 0 if @octal_number.match(/[^0-7]/)
    exponent = -1
    decimal_num = 0

    decimal_num = @octal_number.split('').reverse.map do |digit|
      exponent += 1
      digit.to_i * 8 ** exponent
    end

    decimal_num
  end
end
