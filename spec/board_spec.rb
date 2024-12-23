require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do 
    before (:each) do 
        @board = Board.new
    end

    describe '#initalize' do 
        it 'makes a board exist' do 
            expect(@board).to be_an_instance_of(Board)
        end
    end

    describe "#cell_objects" do
        it "creates the cell objects" do

            # expect(@cells.keys).to eq("A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4")
            # expect(@board.cells).to_be_a(Hash)
        end
    end

end
