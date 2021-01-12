# Classes

class Board
  def print_board
    puts "[ #{Square.new('1')} ] [ #{Square.new('2')} ] [ #{Square.new('3')} ]"
    puts "[ #{Square.new('4')} ] [ #{Square.new('5')} ] [ #{Square.new('6')} ]"
    puts "[ #{Square.new('7')} ] [ #{Square.new('8')} ] [ #{Square.new('9')} ]"
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
