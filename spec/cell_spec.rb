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

        it 'renders a cell not fired upon' do
            @cell_2.place_ship(@cruiser)

            expect(@cell_2.render).to eq(".")
        end

        it 'renders if there is a ship placed' do
            @cell_2.place_ship(@cruiser)
            
            expect(@cell_2.render(true)).to eq("S")
        end

        it 'renders a hit' do
            @cell_2.place_ship(@cruiser)
            @cell_2.fire_upon

            expect(@cell_2.render(true)).to eq("H")
        end

        it 'hits ship until sunk' do
            @cell_2.place_ship(@cruiser)
            @cell_2.fire_upon

            expect(@cruiser.sunk?).to eq(false)

            @cruiser.hit
            @cruiser.hit

            expect(@cruiser.sunk?).to eq(true)
            expect(@cell_2.render).to eq("X")
        end
    end
end