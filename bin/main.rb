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

system 'clear'

puts "Let's begin!"

# Start the game loop
board = Board.new
winner = nil
turn = true

while winner.nil?
  break if board.check_draw(winner)

  current_player = turn ? player1 : player2

  puts "Current player: #{current_player.name}"

  board.print_board

  puts "#{current_player.name} pick one box!"
  input = gets.chomp
  if board.check_input(input)
    board.change_box(input, current_player)
    turn = !turn
  else
    puts "Sorry, you can't cheat in this game. The turn will restart."
  end

  winner = board.check_winner(current_player)
end

# Results!

if winner
  puts ' ====================  The result is...  ======================== '
  puts board.print_board

  puts "Congratulations! Player #{winner.name} is the Winner!"
  puts 'Play again?'
  gets.chomp
end

puts 'DRAW' if winner.nil?
