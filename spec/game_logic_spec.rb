#spec/game_logic_spec.rb
require_relative '../lib/game_logic'

describe Board do

    describe '#check_input' do

        it "returns false if input == 0" do
            board = Board.new
            expect(board.check_input(0)).to be false
        end

        it "returns false unless input.positive? && input < 10" do
            board = Board.new
            expect(board.check_input(-2)).to be false
            expect(board.check_input(12)).to be false
            expect(board.check_input(5)).to be true
        end

        it "returns false unless input.positive? && input < 10" do
            board = Board.new
            expect(board.check_board('X')).to be true
        end

    end

end