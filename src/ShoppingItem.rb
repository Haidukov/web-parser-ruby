class ShoppingItem
    def initialize(index, name, price)
        @index = index
        @name = name
        @price = price
    end

    def index
        return @index
    end 

    def name
        return @name
    end

    def price
        return @price
    end    
end