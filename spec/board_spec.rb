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

        it 'has valid placement' do
          expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
          expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
          

        end

        it 'has ship?' do

        end
    end
end
