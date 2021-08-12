class CashRegister
attr_accessor :discount, :items, :total




    def initialize(discount = 0)
        @discount = discount
        @total_array = []
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total_array << price*quantity
        @total += price*quantity
        quantity_count = quantity
        while quantity_count > 0
            @items << title
            quantity_count -= 1
        end
        # @items.push(title*quantity)
    end

    def total_array
        @total.inject(0, :+)
    end

    def apply_discount 
        @discount > 0 ?
            (@total = @total - @total*@discount/100
            "After the discount, the total comes to $#{@total}.")
        :
        "There is no discount to apply."
    end

    def void_last_transaction
        @total = @total - @total_array[-1]
        @total_array.pop
    end

end





# require './lib/cash_register.rb'