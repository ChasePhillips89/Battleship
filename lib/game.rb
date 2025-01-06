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
      user_cruiser_placement(@user_cruiser)
      second_ship_placement
      user_submarine_placement(@user_submarine)
      user_turn_explanation
      user_fires
      

    
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
    @cpu_board.place(ship, random_coords)
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
 
  def user_cruiser_placement(ship)
    user_input = gets.chomp
    user_coords = user_input.split 
  
    if @user_board.valid_placement?(ship, user_coords)
      @user_board.place(ship, user_coords)
      puts "Successfully placed your #{ship.name}!"
      puts @user_board.board_render(true)
    else
      puts "Invalid placement. Please try again."
      user_cruiser_placement(ship) 
    end
  end

  def second_ship_placement
    puts "Now choose the coordinates and place your Submarine!"
  end

  def user_submarine_placement(ship)
    user_input = gets.chomp
    user_coords = user_input.split 
  
    if @user_board.valid_placement?(ship, user_coords)
      @user_board.place(ship, user_coords)
      puts "Successfully placed your #{ship.name}!"
      puts @user_board.board_render(true)
    else
      puts "Invalid placement. Please try again."
      user_cruiser_placement(ship) 
    end
  end

  def user_turn_explanation
    puts ""
    puts ""
    puts ""
    puts @user_board.board_render(true)
    puts ""
    puts ""
    puts "Here is the current lay of the land,
    select a coordinate to fire upon!"
    puts ""
    puts ""
    puts @cpu_board.board_render
    
  end

  def user_fires
    
    target_coordinate = gets.chomp.upcase

  
    if @cpu_board.cells.key?(target_coordinate) && !@cpu_board.cells[target_coordinate].fired_upon?
      target_cell = @cpu_board.cells[target_coordinate]

      
      target_cell.fire_upon

    
        if target_cell.ship
        if target_cell.ship.sunk?
          puts "You fired at #{target_coordinate} and sunk the CPU's #{target_cell.ship.name}!"
        else
          puts "You fired at #{target_coordinate} and hit a ship!"
        end
      else
        puts "You fired at #{target_coordinate} and missed."
      end
      else
    
      puts "Invalid coordinate or the cell has already been fired upon. Try again."
      user_fires
      end

    end
  
end
