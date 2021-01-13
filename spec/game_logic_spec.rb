require_relative '../lib/game_logic'

player1 = Player.new('X')
player2 = Player.new('O')

draw_board = Board.new
draw_board.change_box('1', player1)
draw_board.change_box('3', player1)
draw_board.change_box('5', player1)
draw_board.change_box('6', player1)
draw_board.change_box('9', player1)
draw_board.change_box('2', player2)
draw_board.change_box('4', player2)
draw_board.change_box('7', player2)
draw_board.change_box('8', player2)

describe Board do
  describe '#check_input' do
    it 'checks valid cases' do
      (1..9).map { |number| expect(Board.new.check_input(number.to_s)).to eql(true) }
      (1..9).map { |number| expect(Board.new.check_input("    #{number}")).to eql(true) }
      (1..9).map { |number| expect(Board.new.check_input("#{number}      ")).to eql(true) }
    end
    it 'checks for invalid input' do
      expect(Board.new.check_input('0')).to eql(false)
      expect(Board.new.check_input('10')).to eql(false)
      expect(Board.new.check_input('a')).to eql(false)
      expect(Board.new.check_input(' ')).to eql(false)
      expect(Board.new.check_input('a 1')).to eql(false)
      expect(Board.new.check_input('1 2')).to eql(false)
    end
    it 'checks for overwritting attempts' do
      (1..9).map { |number| expect(draw_board.check_input(number.to_s)).to eql(false) }
    end
  end
end
