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

    def valid_placement?(ship,coordinates)
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




    

end
