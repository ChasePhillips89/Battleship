require './lib/ship'
require './lib/cell'
require './lib/board' 
require './lib/game'
require 'pry'

RSpec.describe Game do
  describe '#initialize' do
    before(:each) do
      @game = Game.new
    end

    it 'initializes cpu ships with attributes' do
      expect(@game.cpu_cruiser).to be_a(Ship)
      expect(@game.cpu_cruiser.name).to eq("Cruiser")
      expect(@game.cpu_cruiser.length).to eq(3)

      expect(@game.cpu_submarine).to be_a(Ship)
      expect(@game.cpu_submarine.name).to eq("Submarine")
      expect(@game.cpu_submarine.length).to eq(2)
    end

    it 'initializes user ships with attributes' do
      expect(@game.user_cruiser).to be_a(Ship)
      expect(@game.user_cruiser.name).to eq("Cruiser")
      expect(@game.user_cruiser.length).to eq(3)

      expect(@game.user_submarine).to be_a(Ship)
      expect(@game.user_submarine.name).to eq("Submarine")
      expect(@game.user_submarine.length).to eq(2)
    end

    it 'initializes the cpu board' do
      expect(@game.cpu_board).to be_a(Board)
    end

    it 'initializes the user board' do
      expect(@game.user_board).to be_a(Board)
    end
  end
end
