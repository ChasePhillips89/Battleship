require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    before(:each) do
        @cell = Cell.new("B4")
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
        it "initializes" do 
            expect(@cell).to be_an_instance_of(Cell)
        end
    end

    describe "#has_attributes" do
        it "has coordinates" do
            expect(@cell.coordinate).to eq("B4")
        end

        it "checks to see if there is a ship" do
            expect(@cell.ship).to eq(nil)
            expect(@cell.empty?).to eq(true)
        end

        it "places a ship" do
            @cell.place_ship(@cruiser)

            expect(@cell.ship).to eq(@cruiser)
            expect(@cell.empty?).to eq(false)
        end


    end

end