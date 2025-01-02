require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game 
  attr_reader :cpu_board, 
              :user_board, 
  
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
      cpu_cruiser_placement
      cpu_submarine_placement
    # cpu ship placement
    # player ship placement
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

  def cpu_cruiser_placement

  end

  def cpu_submarine_placement
  end
    
end

