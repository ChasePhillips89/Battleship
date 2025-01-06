class Board
    attr_reader :cells 

    def initialize
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
        }
    end

    def valid_coordinate?(coordinate)
        
        @cells.key?(coordinate)
    end 

    def valid_placement?(ship, coordinates)
        valid_length = coordinates.length == ship.length
        
        if same_letters?(coordinates) && consecutive_numbers?(coordinates) && 
            valid_length && valid_coordinates?(coordinates) && coordinates_empty?(coordinates)
            true
        elsif same_numbers?(coordinates) && consecutive_letters?(coordinates) && 
            valid_length && valid_coordinates?(coordinates) && coordinates_empty?(coordinates)
            true
        else false
        end
    end

    def same_letters?(coordinates)
        coordinates.each_cons(2).all? do |coordinate|
            coordinate[0].ord == coordinate[1].ord
        end
    end

    def same_numbers?(coordinates)
        coordinates.each_cons(2).all? do |coordinate|
            coordinate[0].slice(1) == coordinate[1].slice(1)
        end
    end

    def consecutive_letters?(coordinates)
        coordinates.each_cons(2).all? do |coordinate|
            coordinate[0].ord + 1 == coordinate[1].ord
        end
    end

    def consecutive_numbers?(coordinates)
        coordinates.each_cons(2).all? do |coordinate|
            coordinate[0].slice(1).to_i + 1 == coordinate[1].slice(1).to_i
        end
    end

    def coordinates_empty?(coordinates)
        coordinates.all? { |coordinate| @cells[coordinate].empty? }
    end

    def valid_coordinates?(coordinates)
        coordinates.all? do |coordinate|
            valid_coordinate?(coordinate)
        end
    end

    def place(ship, coordinates) 
        if valid_placement?(ship, coordinates) 
            coordinates.each do |coordinate| 
                @cells[coordinate].place_ship(ship) 
            end 
        end 
    end

    def board_render(show_ship = false)
        output = ["  1 2 3 4 \n"]
        row_1 = [@cells["A1"], @cells["A2"], @cells["A3"], @cells["A4"]]
        row_2 = [@cells["B1"], @cells["B2"], @cells["B3"], @cells["B4"]]
        row_3 = [@cells["C1"], @cells["C2"], @cells["C3"], @cells["C4"]]
        row_4 = [@cells["D1"], @cells["D2"], @cells["D3"], @cells["D4"]]

        rows = [row_1, row_2, row_3, row_4]
        
        rows.each do |row|
            row_output = [row[0].coordinate[0]]
            row_output << row.map do |cell|
                cell.render(show_ship)
            end
            row_output << "\n"
            output << row_output.join(" ") 
        end
        output.join
    end

    def all_ships_sunk?
        @cells.values.all? { |cell| cell.ship.nil? || cell.ship.sunk? }
      end
end
