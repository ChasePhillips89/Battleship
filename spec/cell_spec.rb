require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    before(:each) do
        @cell_1 = Cell.new("B4")
        @cell_2 = Cell.new("C3")
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
        it "initializes" do 
            expect(@cell_1).to be_an_instance_of(Cell)
        end
    end

    describe "#has_attributes" do
        it "has coordinates" do
            expect(@cell_1.coordinate).to eq("B4")
        end

        it "checks to see if there is a ship" do
            expect(@cell_1.ship).to eq(nil)
            expect(@cell_1.empty?).to eq(true)
        end

        it "places a ship" do
            @cell_1.place_ship(@cruiser)

            expect(@cell_1.ship).to eq(@cruiser)
            expect(@cell_1.empty?).to eq(false)
        end
    end

    describe '#fired_upon' do  
        it "sees if the ship has been fired upon" do
            @cell_1.place_ship(@cruiser)

            expect(@cell_1.fired_upon?).to eq(false)

            @cell_1.fire_upon

            expect(@cell_1.ship.health).to eq(2)
            expect(@cell_1.fired_upon?).to eq(true)
        end
    end

    describe '#render' do
        it 'renders a miss' do
            expect(@cell_1.render).to eq(".")

            @cell_1.fire_upon

            expect(@cell_1.render).to eq("M")

        end
    end


end