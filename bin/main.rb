#!/usr/bin/env ruby

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

# Printing

# Welcome
puts ' --------------------------------------------------------------- '
puts ' ==============  Welcome to the TicTacToe !  =================== '
puts " Who's going to be the X ? (Please insert a nickname)"
gets.chomp
puts ' Player-X'
puts " Who's going to be the O ? (Please insert a nickname)"
gets.chomp
puts ' Player-O'
puts ' --------------------------------------------------------------- '

puts "Let's begin!"
# Start the game loop
board = Board.new

winner = nil
draw = false
# turn = true

while winner.nil? or draw

  # current_player = turn ? player1 : player 2

  puts board.print_board

  puts 'turn decides which player plays this time'

  puts ' Player <input nick> pick your move '
  puts "INVALID MOVE if #{gets.chomp} is > 0 or < 9 or invalid character or if he tries to change a used square"

  puts 'Here we check if there is a winner. type w to stop the loop'
  puts 'draw = true if no valid moves left'

  winner = true if gets.chomp == 'w'

  puts board.print_board

  # turn = !turn

end

# Results!
puts ' ====================  The result is...  ======================== '
puts board.print_board

puts 'Congratulations! Player <input nick> is the Winner!'
puts 'Play again?'
gets.chomp
