require './lib/ship'
require './lib/cell'
require './lib.board'

RSpec.describe Board do 
    before (:each) do 
        @board = Board.new
    end

    describe '#initalize' do 
        expect(@board).to be_an_instance_of(Board)
    end

end
