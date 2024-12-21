class Cell
    attr_reader :coordinate, :ship, :fired

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired = false
        
        
    end

    def empty?
        @ship.nil? 
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        @fired
    end

    def fire_upon
        @fired = true
        @ship.hit if @ship
        
    end

    def render
        return "M" if @fired && @ship.nil? 
        return "H" if @fired && @ship      
         "."
            
        

    end
end

