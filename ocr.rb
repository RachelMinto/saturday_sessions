
require 'pry'

class OCR
  attr_accessor :text, :lines
  NUMBERS = {'0' => " _ | ||_|", '1' => "  |  |",
             '2' => " _  _||_ ", '3' => " _  _| _|",
             '4' => "|_|  |", '5' => " _ |_  _|",
             '6' => " _ |_ |_|", '7' => " _   |  |",
             '8' => " _ |_||_|", '9' => " _ |_| _|"}

  def initialize(text)
    @text = text
    @lines = text.scan("\n\n").count + 1
    # @numbers_per_line = ((text.slice(0, text.index("\n\n")).length - 1) / 9) if lines > 1
  end

  def convert
    array_of_numbers = []
    paragraph_to_rows_of_nums.each do |rows|
      rows_to_individual_numbers(rows_of_nums_to_lines(rows))
    end
  end

  def paragraph_to_rows_of_nums
    text.split("\n\n")
  end

  def rows_of_nums_to_lines(rows)
    rows.split("\n")
  end

  def rows_to_individual_numbers(rows)
    numbers = []
    numbers_per_line = (rows.first.length / 3.0).ceil
    p numbers_per_line
    numbers_per_line.times |time|
      number = ''
      start = 0
      size_grouping = time == 3 ?  : 3
      rows.each do |row|
        number << row[start, size_grouping]
      end
      start += 3
    end
    numbers
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
