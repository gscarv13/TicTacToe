# Classes

class Player
  attr_reader :name
  attr_writer :name

  def initialize(tag)
    @name = ''
    @tag = tag
  end
end

class Board
  def initialize
    @board_grid = [
      Square.new('1'), Square.new('2'), Square.new('3'),
      Square.new('4'), Square.new('5'), Square.new('6'),
      Square.new('7'), Square.new('8'), Square.new('9')
    ]
  end

  def print_board
    puts "[ #{@board_grid[0]} ] [ #{@board_grid[1]} ] [ #{@board_grid[2]} ]"
    puts "[ #{@board_grid[3]} ] [ #{@board_grid[4]} ] [ #{@board_grid[5]} ]"
    puts "[ #{@board_grid[6]} ] [ #{@board_grid[7]} ] [ #{@board_grid[8]} ]"
  end

  def check_input(input)
    return false unless input.to_i.is_a? Numeric

    input.to_i.positive? && input.to_i < 10 && @board_grid[input.to_i] != ('X' || 'O') ? true : false
  end
end

class Square
  def initialize(char = nil)
    @char = char
  end

  def to_s
    @char
  end
end
