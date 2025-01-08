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

  end

  def start_game
    main_menu
    setup_game
    cpu_placement(@cpu_cruiser)
    cpu_placement(@cpu_submarine) 
    placement_explanation
    user_cruiser_placement(@user_cruiser)
    second_ship_placement
    user_submarine_placement(@user_submarine)
    user_turn_explanation
    game_loop
    play_again?
  end

    
  # Helper_Methods
  def main_menu
    puts ""
    puts ""
    puts ""
    puts "Welcome to BATTLESHIP
      Enter P to play. Enter Q to quit."
    puts ""
    puts ""

    user_input = gets.chomp.upcase
    if user_input == "P"
      puts "Captains, to your BATTLE STATIONS!"
    elsif user_input == "Q"
      puts "Later Loser!"
      exit
    else
      puts "Mind your P's and Q's...please enter 'P' or 'Q'"
      main_menu
    end
  end

  def setup_game
    @cpu_board = Board.new
    @user_board = Board.new
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_submarine = Ship.new("Submarine", 2)
    @user_cruiser = Ship.new("Cruiser", 3)
    @user_submarine = Ship.new("Submarine", 2)
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
          puts ""
          puts "========PLAYER BOARD========"
          puts ""
    puts @user_board.board_render
    puts "Please enter the coordinates for your Cruiser"
  end 
 
  def user_cruiser_placement(ship)
    user_input = gets.chomp.upcase
    user_coords = user_input.split 
  
    if @user_board.valid_placement?(ship, user_coords)
      @user_board.place(ship, user_coords)
      puts "Successfully placed your #{ship.name}!"
      puts ""
      puts "========PLAYER BOARD========"
      puts ""
      puts @user_board.board_render(true)
    else
      puts "You're lost at sea, try placing your ship in charted waters!"
      user_cruiser_placement(ship) 
    end
  end

  def second_ship_placement
    puts "Now choose the coordinates and place your Submarine!"
  end

  def user_submarine_placement(ship)
    user_input = gets.chomp.upcase
    user_coords = user_input.split 
  
    if @user_board.valid_placement?(ship, user_coords)
      @user_board.place(ship, user_coords)
      puts "Successfully placed your #{ship.name}!"
      puts ""
      puts "========PLAYER BOARD========"
      puts ""
      puts @user_board.board_render(true)
    else
      puts "You're lost at sea, try placing your ship in charted waters!"
      user_cruiser_placement(ship) 
    end
  end

  def user_turn_explanation
    puts ""
    puts ""
    puts ""
    puts "========PLAYER BOARD========"
    puts ""
    puts @user_board.board_render(true)
    puts ""
    puts ""
    puts "Here is the current lay of the land,
    select a specifc coordinate to fire upon. I'm WAITING!"
    puts ""
    puts ""
    puts "========COMPUTER BOARD========"
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
          puts "You fired at #{target_coordinate} and sunk my #{target_cell.ship.name}!"
        else
          puts "You fired at #{target_coordinate} and hit my ship!"
        end
      else
        puts "You fired at #{target_coordinate} and missed, unless you were aiming for fish."
        end
      else
      puts "You're shooting into empty waters. Either that or you already hit that spot,
       no need to beat a dead horse! Try again."
      user_fires
      end
    end

    def cpu_fires
      available_cells = @user_board.cells.keys.select do |coordinate|
        !@user_board.cells[coordinate].fired_upon? 
      end

      target_coordinate = available_cells.sample
      target_cell = @user_board.cells[target_coordinate]
      target_cell.fire_upon
    
      if target_cell.ship
        if target_cell.ship.sunk?
          puts "I'm firing at #{target_coordinate} and sunk your #{target_cell.ship.name}!"
        else
          puts "I just fired at #{target_coordinate} and I hit your ship, haha!"
        end
      else
        puts "I'm firing at #{target_coordinate}, crap I missed."
      end
    end

    def turn_results
      puts ""
      puts "========PLAYER BOARD========"
      puts ""
      puts @user_board.board_render(true)
      puts ""
      puts "========COMPUTER BOARD========"
      puts ""
      puts @cpu_board.board_render
    end

    def game_loop
      until game_over?
        user_fires
        break if game_over? 
    
        cpu_fires
        break if game_over? 
    
        turn_results
      end
     
      if @cpu_board.all_ships_sunk?
        puts ""
        puts "========PLAYER BOARD========"
        puts ""
        puts @user_board.board_render
        puts ""
        puts "========COMPUTER BOARD========"
        puts ""
        puts @cpu_board.board_render
        puts ""
        puts "Congratulations! You sank all of my ships."
      else
        puts "Game over! I'm the victor!"
      end
    end
    
   
    def game_over?
      @cpu_board.all_ships_sunk? || @user_board.all_ships_sunk?
    end

    def play_again?
      loop do
        puts "Would you like to return to the Main Menu?"
        puts "Enter 'Y'...If you dare, or 'N' if you're a chicken!"
        user_input = gets.chomp.upcase
    
      if user_input == "Y"
        start_game
        break
      elsif user_input == "N"
        puts "Thanks for the match, see you soon!"
        break
      else
        puts "Invalid input, haven't we been over this? Please enter 'Y' to play again or 'N' to quit."
      end
    end
  end
end 
