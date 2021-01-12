#!/usr/bin/env ruby

require_relative '../lib/game_logic'

# Instantiate the Player class
player1 = Player.new('X')
player2 = Player.new('O')

# Welcome
puts ' --------------------------------------------------------------- '
puts ' ==============  Welcome to the TicTacToe !  =================== '
puts " Who's going to be the X ? (Please insert a nickname)"
player1.name = gets.chomp
puts " Player #{player1.name} is the X"
puts " Who's going to be the O ? (Please insert a nickname)"
player2.name = gets.chomp
puts " Player #{player2.name} is the O"
puts ' --------------------------------------------------------------- '

puts "Let's begin!"
system 'clear'

# Start the game loop
board = Board.new

winner = nil
draw = false
turn = true

while winner.nil? or draw

  current_player = turn ? player1 : player2

  puts "Current player: #{current_player.name}"

  board.print_board

  puts "#{current_player.name} pick one box!"
  input = gets.chomp
  if board.check_input(input)
    # Change box
    turn = !turn
  else
    puts "Sorry, you can't cheat in this game. The turn will restart."
  end

  # Check for Winner or Draw ? BREAK THE LOOP : KEEP LOOPING

end

# Results!
puts ' ====================  The result is...  ======================== '
puts board.print_board

puts 'Congratulations! Player <input nick> is the Winner!'
puts 'Play again?'
gets.chomp
