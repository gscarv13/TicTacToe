#!/usr/bin/env ruby

require_relative '../lib/game_logic'

# Instantiate the Player class
player1 = Player.new('X')
player2 = Player.new('O')
again = true

while again

  # Welcome
  puts ' --------------------------------------------------------------- '
  puts ' ==============  Welcome to the TicTacToe !  =================== '
  puts " Who's going to be the X ? (Please insert a nickname)"
  puts
  player1.name = gets.chomp
  puts
  puts " ---> Player #{player1.name} is the X"
  puts
  puts " Who's going to be the O ? (Please insert a nickname)"
  puts
  player2.name = gets.chomp
  puts
  puts " ---> Player #{player2.name} is the O"
  puts ' --------------------------------------------------------------- '
  puts
  puts 'Press Enter to start!'
  gets
  system 'clear'

  puts "Let's begin!"

  # Start the game loop
  board = Board.new
  winner = nil
  turn = true
  message = ''

  while winner.nil?
    system 'clear'
    puts message
    puts
    message = ''
    break if board.check_draw(winner)

    current_player = turn ? player1 : player2

    puts "Current player: #{current_player.name}"
    puts

    board.print_board

    puts "#{current_player.name} pick one box!"
    puts
    input = gets.chomp
    if board.check_input(input)
      board.change_box(input, current_player)
      turn = !turn
    else
      message = "Sorry, you can't cheat in this game. The turn will restart."
    end

    winner = board.check_winner(current_player)
  end

  # Results!
  puts ' ====================  The result is...  ======================== '
  puts

  if winner
    puts board.print_board
    puts
    puts "Congratulations! Player #{winner.name} is the Winner!"
  end

  puts 'DRAW' if winner.nil?

  puts "Play again? Type 'n' to exit"
  break if gets.chomp.include?('n')
end
