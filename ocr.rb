
require 'pry'

class OCR
  attr_accessor :text, :numbers_count
  NUMBERS = {'0' => " _ | ||_|", '1' => "  |  |",
             '2' => " _  _||_ ", '3' => " _  _| _|",
             '4' => "|_|  |", '5' => " _ |_  _|",
             '6' => " _ |_ |_|", '7' => " _   |  |",
             '8' => " _ |_||_|", '9' => " _ |_| _|"}

  def initialize(text)
    @text = text
    text.gsub!("_\n",'_ ')
    self.text.delete!("\n") if text.include?("\n")
    @numbers_count = text.length > 9 ? text.length / 9.0 : 1.0
  end

  def convert
    return '?' if self.text.length % 3 != 0
    number_code = find_num_array(text)
    number = ''
    p number_code
    number_code.each do |code|
      number += NUMBERS.has_value?(code) ? NUMBERS.key(code) : "?"
      number[-1] = '1' if code == "     |  |"
      number[-1] = '4' if code == "   |_|  |"
    end
    number
  end

  def find_num_array(text)
    num_array = make_num_array
    sections_of_letter = 0
    letter_index = 0
    text.split('').each do | character |
      if sections_of_letter == 3
        sections_of_letter = 0
        letter_index += 1
      end
      if letter_index == self.numbers_count
        letter_index = 0
      end
      num_array[letter_index] << character
      sections_of_letter += 1
    end
    join_letter_codes(num_array)
  end

  private

  def make_num_array
    array = []
    numbers_count.to_i.times { |num| array.push([]) }
    array
  end

  def join_letter_codes(num_array)
    num_code_array = []
    num_array.each do |num_code|
      num_code_array << num_code.join('')
    end
    num_code_array
  end
end

text = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER
  OCR.new(text).convert
