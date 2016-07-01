
class Board
  def initialize
  end

  def self.transform(inp)
    output = []
    inp.each do |row|
      if row == inp.first
        output << row
      else
        new_row = []
        row.chars.map do |char| 
          char = char == ' ' ? number_adjacent_mines(adjacent_spaces) : char
          new_row << char
        end
        output << new_row.join
      end
    end
    puts output
  end

  def adjacent_spaces
    
  end

  def self.number_adjacent_mines(char)

  end


end

class String

end


  inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
         '| *  * |', '|      |', '+------+']
  out = ['+------+', '|1*22*1|', '|12*322|', '| 123*2|', '|112*4*|',
         '|1*22*2|', '|111111|', '+------+']

Board.transform(inp)
# Board.transform(out)