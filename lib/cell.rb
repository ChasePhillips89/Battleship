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

    def render(show_ship = false)
        return "X" if @ship && @ship.sunk?
        return "H" if @fired && @ship
        return "M" if @fired && @ship.nil? 
        return "S" if show_ship && @ship
        "."
    end
end

