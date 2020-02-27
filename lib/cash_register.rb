class CashRegister 
  attr_accessor :total, :discount
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @last_item = item 
    @last_price = price
    @total += (price*quantity)
    total_items = Array.new(quantity, item)
    @items << total_items
  end
  
  def apply_discount
    if @discount == 0 
      "There is no discount to apply."
    else
      @total -= (@total*((@discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{@total}."
    end
  end 
    
  def items 
    @items.flatten
  end
  
  def void_last_transaction
    @total -= @last_price
    @items.pop
    if @items == [] 
      @total = 0
    end
  end
end