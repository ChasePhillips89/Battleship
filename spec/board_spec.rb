require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

RSpec.describe Board do 
    before (:each) do 
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
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
            expect(@board.valid_coordinate?("A1")).to eq(true)
            expect(@board.valid_coordinate?("D4")).to eq(true)
            expect(@board.valid_coordinate?("A5")).to eq(false)
            expect(@board.valid_coordinate?("E1")).to eq(false)
            expect(@board.valid_coordinate?("A22")).to eq(false)
        end
    end

    describe "#ship_placements" do
        it 'has coordinates that match ship length' do
          expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
          expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
        end

        it 'has same letters' do
          expect(@board.same_letters?(["A1", "A2", "A3"])).to eq(true)
          expect(@board.same_letters?(["A1", "B2", "B3"])).to eq(false)
        end

        it 'has the same numbers' do
          expect(@board.same_numbers?(["A1", "B1", "C1"])).to eq(true)
          expect(@board.same_numbers?(["A1", "B2", "C1"])).to eq(false)
        end

        it 'has consecutive letters' do
          expect(@board.consecutive_letters?(["A1", "B1", "C1"])).to eq(true)
          expect(@board.consecutive_letters?(["A1", "B1", "A2"])).to eq(false)
        end

        it 'has consecutive numbers' do
          expect(@board.consecutive_numbers?(["A1", "A2", "A3"])).to eq(true)
          expect(@board.consecutive_numbers?(["A1", "A4", "A3"])).to eq(false)
        end

        it 'has valid placement and cannot be diagonal' do
          expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
          expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
        end
    end

    describe "#placing_ship" do
        it 'places the ship on the board' do
            cell_1 = @board.cells["A1"]
            cell_2 = @board.cells["A2"]
            cell_3 = @board.cells["A3"]

            @board.place(@cruiser, ["A1", "A2", "A3"])    

            expect(cell_1.ship).to eq(@cruiser)
            expect(cell_2.ship).to eq(@cruiser)
            expect(cell_3.ship).to eq(@cruiser)

            expect(cell_3.ship == cell_2.ship).to eq(true)
            expect(cell_2.ship == cell_1.ship).to eq(true)
            expect(cell_1.ship == cell_3.ship).to eq(true)
        end

        it 'makes sure you cannot place two ships at the same corrdinates' do
            @board.place(@cruiser, ["A1", "A2", "A3"])  

            expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
        end
    end

    describe "#rendering_the_board" do
        it 'renders the board for the user' do
            @board.place(@cruiser, ["A1", "A2", "A3"]) 
            @board.render

            expect(@board.render).to eq(true)
        end
    end

end
