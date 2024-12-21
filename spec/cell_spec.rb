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

end