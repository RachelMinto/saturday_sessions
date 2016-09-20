
class Diamond
  LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  
  def self.make_diamond(letter)
    letter_position = LETTERS.index(letter)
    width = letter_position * 2 + 1
    @letters_in_diamond = LETTERS[0..letter_position].split('')
    structure_diamond(width)
  end

  def self.structure_diamond(width)
    diamond_top = @letters_in_diamond.each_with_index.map do |letter, index| 
      if index == 0
        letter.center(width) + "\n"
      else
        diamond_center = " " * (index * 2 - 1)
        row = "#{letter}" + diamond_center + "#{letter}"
        row.center(width) + "\n"
      end 
    end
    
    (diamond_top + diamond_top.reverse[1..-1]).join
  end
end

module Bookkeeping
  VERSION = 1
end