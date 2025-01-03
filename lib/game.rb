require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game 
  attr_reader :cpu_board, 
              :user_board, 
              :cpu_cruiser, 
              :cpu_submarine, 
              :user_cruiser,
              :user_submarine
  
  def initialize 
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
    @cpu_board = Board.new
    @user_board = Board.new
    # @cell = Cell.new
    # # player sub
    # # cpu sub
    # # plyer cruiser
    # # player cruiser

  end

  def start_game
      main_menu
      cpu_placement(@cpu_cruiser)
      cpu_placement(@cpu_submarine) 
      placement_explanation

    # player cruiser placement
    # player submarine placement
    # game explination
    # display board
    # player guess
      # report results
    # cpu guess
      # report results
    # display boards
    # check if there is a winner
    # End game
  end
    
  # Helper_Methods
  def main_menu
    puts ""
    puts ""
    puts ""
    puts "Welcome to BATTLESHIP
      Enter p to play. Enter q to quit."
    puts ""
    puts ""

    user_input = gets.chomp
    if user_input == "p"
      puts "Let's Begin!"
    elsif user_input == "q"
      puts "Later Loser!"
    else
      puts "Mind your 'p's and 'q's...please enter 'p' or 'q'"
    end
  end

  def cpu_placement(ship)
    random_coords = []
    until @cpu_board.valid_placement?(ship, random_coords) do
      random_coords = @cpu_board.cells.keys.sample(ship.length)
    end
    @cpu_board.place(@cpu_cruiser, random_coords)
  end

  def placement_explanation
    puts ""
    puts ""
    puts ""
    puts "I have laid out my ships on the grid.
          You now need to lay out your two ships.
          The Cruiser is three units long and the Submarine is two units long."
    puts @user_board.board_render
    puts "Please enter the coordinates for your Cruiser"
  end 

end
