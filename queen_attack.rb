class Queens
  attr_reader :white, :black
  
  def initialize(white: [0, 3], black: [7, 3])
    @board = []
    8.times { @board.push(['_', '_', '_', '_', '_', '_', '_', '_']) }
    @white = white
    @black = black
    valid_placement?
    place_white_queen
    place_black_queen
  end
  
  def to_s
    printable_board = 
    # @board.each {|row| row.join(' ')}
    printable_board
  end
  
  def valid_placement?
    raise ArgumentError if @white == @black
  end
  
  def place_white_queen
    row_number = @white[0]
    column_number = @white[1]
    @board[row_number][column_number] = 'W'
  end
  
  def place_black_queen
    row_number = @black[0]
    column_number = @black[1]
    @board[row_number][column_number] = 'B'
  end
  
  def attack?
    same_row? || same_column? || diagonal?
  end
  
  def same_row?
    
  end
  
  def same_column?
    
  end
  
  def diagonal?
    
  end
end

# test_queens = Queens.new()
# test_queens.to_s
# p test_queens.white

=begin
  Create Queen Class
  Board will be an 8 x 8 array.
  Default placeholder for 'square' should be _
  Will want to mark position of white and black queens within array. 
    -Default should be [0, 3] for white and [7, 3] for black, although can be specified when Queens object is created.
  Give error if both queens are inserted into same 'square'
  Queen object should have a w and b property that returns placement of white and black queens respectively
  A to_s method should be provided that prints out each array within the array on a separate line.
  A attack? method should be provided which returns a boolean as to whether the two queens are in an attack position.
    -check if in same column, row or in a diagonal.
      Same column: Same index but in another array.
      Same Row: In same array.
      Diagonal: Same distance away in index number as in array number.
=end