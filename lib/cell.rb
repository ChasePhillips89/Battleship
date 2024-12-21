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
end

