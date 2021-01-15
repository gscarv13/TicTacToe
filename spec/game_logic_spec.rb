# spec/game_logic_spec.rb
require_relative '../lib/game_logic'

# Intantiate classes
player1 = Player.new('X')
player2 = Player.new('O')

clear_board = Board.new

win1 = Board.new

win1.change_box('1', player1)
win1.change_box('4', player1)
win1.change_box('7', player1)

win2 = Board.new
win2.change_box('1', player2)
win2.change_box('4', player2)
win2.change_box('7', player2)

draw = Board.new
draw.change_box('1', player1)
draw.change_box('2', player1)
draw.change_box('3', player2)
draw.change_box('4', player2)
draw.change_box('5', player2)
draw.change_box('6', player1)
draw.change_box('7', player1)
draw.change_box('8', player2)
draw.change_box('9', player1)

describe Board do
  describe '#check_input' do
    it 'returns false if input == 0' do
      board = Board.new
      expect(board.check_input(0)).to be false
    end

    it 'returns false unless input.positive? && input < 10' do
      board = Board.new
      expect(board.check_input(-2)).to be false
      expect(board.check_input(12)).to be false
      expect(board.check_input(5)).to be true
    end
  end

  describe '#check_board' do
    it 'Check if current box was previously chosen' do
      expect(clear_board.check_board('1')).to be true
      expect(win1.check_board('1')).to be false
      expect(win2.check_board('7')).to be false
      expect(draw.check_board('9')).to be false
    end
  end

  describe '#check_winner' do
    it 'Check if or the winner' do
      expect(win1.check_winner(player1)).to be player1
      expect(win2.check_winner(player2)).to be player2
      expect(draw.check_winner(player2)).to be nil
    end
  end

  describe '#check_draw' do
    it 'Check if it is a draw' do
      expect(draw.check_draw(nil)).to be true
      expect(draw.check_draw(player1)).to be nil
    end
  end
end
