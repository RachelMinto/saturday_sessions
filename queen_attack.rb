class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    set_up_board

    @white = white
    @black = black

    valid_placement?
    set_starting_coordinates
    place_queens
  end

  def set_up_board
    @board = []
    8.times { @board.push([].fill('_', 0...8)) }
  end

  def to_s
    @board.map { |row| row.join(' ') }.join("\n")
  end

  def valid_placement?
    raise ArgumentError, 'Queens cannot be in same square.' if @white == @black
  end

  def set_starting_coordinates
    @white_col = @white[1]
    @white_row = @white[0]
    @black_col = @black[1]
    @black_row = @black[0]
  end

  def place_queens
    @board[@white_row][@white_col] = 'W'
    @board[@black_row][@black_col] = 'B'
  end

  def attack?
    same_row? || same_column? || diagonal?
  end

  def same_row?
    @white_row == @black_row
  end

  def same_column?
    @white_col == @black_col
  end

  def diagonal?
    rows_apart = (@white_row - @black_row).abs
    cols_apart = (@white_col - @black_col).abs
    rows_apart == cols_apart
  end
end
