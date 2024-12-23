require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do 
    before (:each) do 
        @board = Board.new
    end

    describe '#initialize' do 
        it 'makes a board exist' do 
            expect(@board).to be_an_instance_of(Board)
        end
    end

    describe "#cell_objects" do
        it "creates the cell objects" do

            expect(@board.cells.keys).to include("A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4")
        end

        it "checks on cell coordinates" do
            
            exoect(board.valid_)
        end
    end

end
